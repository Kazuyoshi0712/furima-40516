class AddColumnsToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :name, :string, null: false
    add_column :items, :description, :text, null: false
    add_column :items, :category_id, :integer, null: false
    add_column :items, :status_id, :integer, null: false
    add_column :items, :delivery_fee_id, :integer, null: false
    add_column :items, :prefecture_id, :integer, null: false
    add_column :items, :delivery_day_id, :integer, null: false
    add_column :items, :price, :integer, null: false
    add_reference :items, :user, foreign_key: true, null: false
  end
end
