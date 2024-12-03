class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :new]
  before_action :set_item
  before_action :check_user

  def index
    @purchase = PurchaseForm.new
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
  end

  def new
    @purchase = PurchaseForm.new
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
  end

  def create
    @purchase = PurchaseForm.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      puts @purchase.errors.full_messages 
      redirect_to root_path, notice: '商品を購入しました'
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def check_user
    redirect_to root_path if current_user == @item.user || @item.sold_out?
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    begin
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
    rescue Payjp::PayjpError => e
      Rails.logger.error("PAY.JPエラー: #{e.message}")
      redirect_to item_path(@item), alert: '決済に失敗しました。再度お試しください。'
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_form).permit(:postal_code, :prefecture_id, :city, :address, :building,
                                          :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],
                                                               token: params[:token])
  end
end
