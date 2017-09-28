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
    @subjects = Subject.all
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to action: 'list'
    else
      @subjects = Subject.all
      render action: 'new'
    end
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])

    if @book.update_attributes(book_param)
      redirect_to action: 'show', id: @book
    else
      @subjects = Subject.all
      render action: 'edit'
    end
  end
    
  def delete
    Book.find(params[:id]).destroy
    redirect_to action: 'list'
  end

  private

  def book_params
    params.require(:books).permit(:title, :author, :user_id, :first_published, :create_on)
  end
end
