class AddColumnToRefs < ActiveRecord::Migration
  def change
    add_reference :refs, :facture
  end
end
