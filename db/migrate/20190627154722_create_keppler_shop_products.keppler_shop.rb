# This migration comes from keppler_shop (originally 20190627154716)
class CreateKepplerShopProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :keppler_shop_products do |t|
      t.string :image
      t.string :title
      t.string :subtitle
      t.text :description
      t.float :price
      t.float :offer_price
      t.jsonb :files
      t.integer :position
      t.datetime :deleted_at
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
