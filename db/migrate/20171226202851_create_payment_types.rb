class CreatePaymentTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_types do |t|
      t.text :payment_type
      t.text :account_number
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
