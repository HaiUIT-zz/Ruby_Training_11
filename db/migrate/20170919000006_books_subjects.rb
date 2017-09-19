class BooksSubjects < ActiveRecord::Migration[5.1]
  def self.up
    create_table :books_subjects, id: false do |t|
      t.column :book_id, :integer, null: false
      t.column :subject_id, :integer, null: false
    end
    add_foreign_key :books_subjects, :books
    add_foreign_key :books_subjects, :subjects
  end

  def self.down
    drop_table :books_subjects
  end
end
