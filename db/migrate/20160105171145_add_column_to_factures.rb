class AddColumnToFactures < ActiveRecord::Migration
  def change
    add_column :factures, :status, :string
    add_reference :factures, :client
    add_column :factures, :emetteur, :text
    add_column :factures, :date_emission, :string
    add_column :factures, :date_limite, :string
  end
end
