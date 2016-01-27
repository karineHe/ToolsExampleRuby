class RemoveColumnFromRefs < ActiveRecord::Migration
  def change
    remove_column :refs, :facture_id
  end
end
