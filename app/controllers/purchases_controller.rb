class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      redirect_to root_path, notice: '商品を購入しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase).permit(:item_id).merge(user_id: current_user.id)
  end
end
