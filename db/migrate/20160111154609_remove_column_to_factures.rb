class RemoveColumnToFactures < ActiveRecord::Migration
  def change
    remove_column :factures, :date_limite
    remove_column :factures, :date_emission
  end
end
