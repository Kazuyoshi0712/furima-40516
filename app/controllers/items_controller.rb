class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # before_action :set_item, only: [:show, :edit, :update, :destroy]
  # before_action :check_owner, only: [:edit, :update, :destroy]
  def index
    @items = Item.all.order(created_at: 'DESC')
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
    @resource = @item
  end

  # def edit
  # @item = Item.find(params[:id])
  # @resource = @item
  # end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def check_owner
    redirect_to root_path unless current_user == @item.user
  end

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :delivery_fee_id, :prefecture_id,
                                 :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
