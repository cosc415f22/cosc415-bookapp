require 'rails_helper'

RSpec.describe "Cruds", type: :system do
  before do
    driven_by(:rack_test)
  end
  before(:each) do
    @book = Book.create!(title: "Book title", list_price: 10.99, year: 1999, pages: 200)
  end

  describe "show" do
    it "should be accessible from link on index" do
      visit books_path
      click_on "Book title"
      expect(page).to have_current_path(book_path(@book))
      expect(page).to have_content("Book title")
      expect(page).to have_content("List price 10.99")
      expect(page).to have_content("Year 1999")
      expect(page).to have_content("Pages 200")
    end
  end

  describe "index" do
    it "should show the books list" do
      visit books_path
      expect(page).to have_content(/Book title/)
    end
  end

  describe "edit/update" do
    it "should correctly edit a book (happy path)" do
      visit book_path(@book)
      click_on "Edit book details"
      fill_in "book_list_price", with: 49.99
      click_on "Save changes to book"
      expect(page).to have_current_path(book_path(@book))
      expect(page).to have_content(/List price 49.99/)
    end
  end

  describe "delete" do
    it "should correctly delete a book" do
      visit book_path(@book)
      click_on "Delete book"
      expect(page).to have_current_path(books_path)
      expect(page).to have_content(/Book 'Book title' deleted/)
    end
  end
end
