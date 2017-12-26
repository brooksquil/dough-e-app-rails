class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.text :first_name
      t.text :last_name
      t.text :title      
      t.text :email
      t.text :password_digest
      t.text :work_phone
      t.text :mobile_phone
      t.boolean :is_active
      t.boolean :is_admin
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
