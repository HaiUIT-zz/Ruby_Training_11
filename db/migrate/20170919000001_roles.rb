class Roles < ActiveRecord::Migration[5.1]
  def self.up
    create_table :roles do |t|
      t.column :name, :string, limit: 10, null: false
      t.column :is_deleted, :boolean, null: false
    end
  end

  def self.down
    drop_table :roles
  end
end
