class BooksController < ApplicationController
  def index
    @books = Book.all.order(:list_price)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    b = Book.new(create_params) # "mass assignment" of attributes!
    if b.save
      flash[:notice] = "Book #{b.title} successfully created"
      redirect_to books_path
    else
      flash[:warning] = "Book couldn't be created"
      # redirect_to new_book_path
      @book = b
      render 'new'
    end
  end

private
  def create_params
    # we require a book to be in params
    # allow name, description, and price to be mass-assigned
    params.require(:book).permit(:title, :publisher, :list_price, :pages, :year)
  end
end
