class CreateQuantityTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :quantity_types do |t|
      t.text :name
      t.integer :quantity

      t.timestamps
    end
  end
end
