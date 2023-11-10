class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.date :order_date
      t.string :order_number
      t.float :total_amount

      t.timestamps
    end
  end
end
