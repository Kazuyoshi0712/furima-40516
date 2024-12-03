class PurchaseForm < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'はハイフンを含めてください' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'を選んでください' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁または11桁の数字のみ入力できます' }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id:, item_id:)
    Address.create(postal_code:, prefecture_id:, city:, address:, building:,
                   phone_number:, order_id: order.id)
  end
end
