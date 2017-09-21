class ChangeBookTableColumnToNullable < ActiveRecord::Migration[5.1]
  def change
    change_column :books, :first_published, :timestamp, null: true
  end
end
