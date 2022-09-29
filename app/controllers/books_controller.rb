class BooksController < ApplicationController
  def index
    @books = Book.all.order(:list_price)
  end

  def show
    @book = Book.find(params[:id])
  end
end
