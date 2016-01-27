class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :facture_id
      t.integer :ref_id
    end
    add_index :assignments, :facture_id
    add_index :assignments, :ref_id
  end
end
