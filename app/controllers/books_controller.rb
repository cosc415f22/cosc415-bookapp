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
    @book = Book.new(create_params) # "mass assignment" of attributes!
    if @book.save
      flash[:notice] = "Book #{b.title} successfully created"
      redirect_to books_path
    else
      flash[:warning] = "Book couldn't be created"
      render 'new'
      # rendering explicitly to new path can be better because of
      # being able to "fill in" the form with existing data in @book
      #
      # redirect_to new_book_path
    end
  end

private
  def create_params
    # we require a book to be in params
    # allow name, description, and price to be mass-assigned
    params.require(:book).permit(:title, :publisher, :list_price, :pages, :year)
  end
end
