class AddChangeToFactures < ActiveRecord::Migration
  def change
    remove_column :factures, :client
    add_reference :factures, :contact
    add_reference :factures, :company
  end
end
