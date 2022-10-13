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
    b = Book.new(create_update_params) # "mass assignment" of attributes!
    if b.save
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

  def edit
    @book = Book.find params[:id]
  end

  def update
    @book = Book.find params[:id]
    @book.update(create_update_params)
    flash[:notice] = "#{@book.title} was successfully updated."
    redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book '#{@book.title}' deleted."
    redirect_to books_path
  end

private
  def create_update_params
    # we require a book to be in params
    # allow name, description, and price to be mass-assigned
    params.require(:book).permit(:title, :publisher, :list_price, :pages, :year)
  end
end
