require 'rails_helper'

RSpec.describe "CreateBooks", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe "create new book" do
    it "happy path" do
      visit books_path
      click_on 'Create new book'
      expect(page.current_path).to eq(new_book_path)
      fill_in :book_title, with: 'a new book'
      fill_in :book_publisher, with: 'publisher' fill_in :book_year, with: '2021'
      fill_in :book_pages, with: 10
      fill_in :book_list_price, with: 9.99
      click_on 'Create book'
      expect(page.text).to match(/Book a new book successfully created/)
      expect(page.current_path).to eq(books_path)
    end
  end
end
