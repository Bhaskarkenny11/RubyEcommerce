class productversions < ActiveRecord::Migration[7.0]
  def change
    create_table :product_versions do |t|
      t.references :product, null: false, foreign_key: true
      t.text :data

      t.timestamps
    end
  end
end
