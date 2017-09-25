class BookDatatable < AjaxDatatablesRails::Base
  def view_columns
    @view_columns ||= {
      id: { source: 'Book.id', cond: :eq, searchable: false, orderable: false },
      title: { source: 'Book.title', cond: :like },
      author: { source: 'Book.author', cond: :like, searchable: false, orderable: false },
      first_published: { source: 'Book.first_published', cond: :date_range, searchable: false, orderable: false }
    }
  end

  private

  def data
    records.map do |book|
      {
        id: book.id,
        title: book.title,
        author: book.author,
        first_published: book.first_published
      }
    end
  end

  def get_raw_records
    Book.all
  end
end
