class CreateKepplerShopReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :keppler_shop_reservations do |t|
      t.string :full_name
      t.string :dni
      t.string :email
      t.string :phone
      t.string :country
      t.string :product_name
      t.references :product, foreign_key: true
      t.integer :position
      t.datetime :deleted_at
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
