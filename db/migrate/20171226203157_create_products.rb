class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.text :name
      t.text :description
      t.float :price
      t.boolean :is_active
      t.references :product_type, foreign_key: true
      t.references :quantity_type, foreign_key: true
      t.references :company, foreign_key: true
      t.timestamps
    end
  end
end
