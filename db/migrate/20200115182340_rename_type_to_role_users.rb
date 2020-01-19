class RenameTypeToRoleUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :type, :role
    change_column_null :users, :role, false, 'none'
  end
end
