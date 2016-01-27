class CreateFactures < ActiveRecord::Migration
  def change
    create_table :factures do |t|

      t.timestamps null: false
    end
  end
end
