class BooksController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: BookDatatable.new(view_context) } 
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = 1
    @book.created_on = Time.current
    @book.is_deleted = false

    if @book.save
      redirect_to action: 'index'
    else
      render action: 'new'
    end
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])

    if @book.update_attributes(book_params)
      redirect_to action: 'show', id: @book
    else
      @subjects = Subject.all
      render action: 'edit'
    end
  end
    
  def destroy
    @book = Book.find(params[:id])
    if @book.update_attributes(is_deleted: true)
      render json: { success: true }
    else
      render json: { success: false }
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :first_published, subject_ids: [])
  end
end
