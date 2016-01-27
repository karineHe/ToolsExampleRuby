class AddObjToFactures < ActiveRecord::Migration
  def change
    add_column :factures, :objet, :text
  end
end
