class CreateRefs < ActiveRecord::Migration
  def change
    create_table :refs do |t|
      t.string :name
      t.text :desc
      t.float :pu_ht
      t.float :tva

      t.timestamps null: false
    end
  end
end
