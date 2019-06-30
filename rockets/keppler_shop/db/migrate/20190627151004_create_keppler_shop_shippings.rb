class CreateKepplerShopShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :keppler_shop_shippings do |t|
      t.string :company_name
      t.string :sucursal_name
      t.integer :position
      t.datetime :deleted_at
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
