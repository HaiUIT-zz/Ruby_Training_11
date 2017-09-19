class Permissions < ActiveRecord::Migration[5.1]
  def self.up
    create_table :permissions do |t|
      t.column :name, :string, limit: 20, null: false
      t.column :is_deleted, :boolean, null: false
    end
  end

  def self.down
    drop_table :permissions
  end
end
