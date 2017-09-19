class Books < ActiveRecord::Migration[5.1]
  def self.up
    create_table :books do |t|
      t.column :title, :string, limit: 50, null: false
      t.column :author, :string, limit: 50, null: false
      t.column :first_published, :timestamp, null: false
      t.column :user_id, :integer, null: false
      t.column :created_on, :timestamp, null: false
      t.column :is_deleted, :boolean, null: false
    end
    add_foreign_key :books, :users
  end

  def self.down
    drop_table :books
  end
end
