class Users < ActiveRecord::Migration[5.1]
  def self.up
    create_table :users do |t|
      t.column :user_id, :string, limit: 20, null: false
      t.column :password, :string, limit: 60, null: false
      t.column :name, :string, limit: 50, null: false
      t.column :email, :string, limit: 50, null: false
      t.column :role_id, :integer, null: false
      t.column :is_deleted, :boolean, null: false
    end
    add_foreign_key :users, :roles
  end

  def self.down
    drop_table :users
  end
end
