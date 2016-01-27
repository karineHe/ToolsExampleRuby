class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.string :phone
      t.string :fax
      t.string :email
      t.text :address

      t.timestamps null: false
    end
  end
end
