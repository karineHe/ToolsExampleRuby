class RemoveColumnFromCompanies < ActiveRecord::Migration
  def change
    remove_column :companies, :contact_id
    add_reference :contacts, :company
  end
end
