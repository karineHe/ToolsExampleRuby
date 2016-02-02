class AddColumnToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :qty, :integer
  end
end
