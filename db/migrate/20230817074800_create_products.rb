class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
     t.string :name
     t.text :descrption
     t.float :price
     t.integer :category_id
     t.integer :stock
     t.boolean :code_eligibility, default: true
         #arguments for method we use colon before,
    #options for method we use colon after ex..default: true
     t.string :image_url


      t.timestamps
    end
  end
end
