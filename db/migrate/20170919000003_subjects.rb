class Subjects < ActiveRecord::Migration[5.1]
  def self.up
    create_table :subjects do |t|
      t.column :title, :string, limit: 50, null: false
      t.column :is_deleleted, :boolean, null: false
    end
  end

  def self.down
    drop_table :subjects
  end
end
