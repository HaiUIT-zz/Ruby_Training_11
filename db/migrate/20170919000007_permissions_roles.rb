class RolesPermissions < ActiveRecord::Migration[5.1]
  def self.up
    create_table :permissions_roles, id: false do |t|
      t.column :role_id, :integer, null: false
      t.column :permission_id, :integer, null: false
    end
    add_foreign_key :roles_permissions, :roles
    add_foreign_key :roles_permissions, :permissions
  end

  def self.down
    drop_table :roles_permissions
  end
end
