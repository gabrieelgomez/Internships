# This migration comes from keppler_shop (originally 20190701000524)
class CreateKepplerShopReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :keppler_shop_reservations do |t|
      t.string :full_name
      t.string :dni
      t.string :email
      t.string :phone
      t.string :country
      t.string :product_name
      t.belongs_to :product, index: true
      t.belongs_to :shipping, index: true
      t.integer :position
      t.datetime :deleted_at
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
