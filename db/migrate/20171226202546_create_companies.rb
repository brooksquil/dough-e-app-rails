class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.text :company_name
      t.text :shipping_address
      t.text :shipping_address_2
      t.text :shipping_city
      t.text :shipping_state
      t.string :shipping_zipcode
      t.text :shipping_notes, null: true
      t.text :billing_street_address
      t.text :billing_address_2
      t.text :billing_state
      t.text :billing_zipcode
      t.text :company_phone
      t.text :email      
      t.text :payment_terms, null: true
      t.boolean :is_active

      t.timestamps
    end
  end
end
