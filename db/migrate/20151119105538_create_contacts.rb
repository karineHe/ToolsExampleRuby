class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :civ
      t.string :lname
      t.string :fname
      t.string :job
      t.text :address
      t.string :email
      t.string :phone
      t.string :cell
      t.string :fax

      t.timestamps null: false
    end
  end
end
