class RenameTypeToRoleUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :type, :role
    change_column :users, :role, :string, default: 'none', null: false
  end
end
