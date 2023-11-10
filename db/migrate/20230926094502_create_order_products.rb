class CreateOrderProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :order_products do |t|
      t.integer :order_id
      t.integer :product_id
      t.float :price
      t.float :total
      
      t.timestamps
    end
  end
end
