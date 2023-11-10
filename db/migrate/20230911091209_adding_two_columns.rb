class AddingTwoColumns < ActiveRecord::Migration[7.0]
  def change
  add_column :products, :Product_code, :string
  add_column :categories,:category_code,:string
  end
end
