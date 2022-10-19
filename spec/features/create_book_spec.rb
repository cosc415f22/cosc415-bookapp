require 'rails_helper'

RSpec.feature "CreateBooks", type: :feature do
  # include Devise::Test::IntegrationHelpers # if we have authentication installed
  context "Create a new book" do
    it "should successfully create a new book when the form is filled in" do
      # sign_in  
      visit books_path
      click_on "Create a new book"
      expect(page).to have_current_path(new_book_path)
      fill_in :book_title, with: "Rails self help"
      fill_in :book_publisher, with: "Nobody"
      fill_in :book_year, with: "1999"
      fill_in :book_pages, with: "200"
      fill_in :book_list_price, with: "19.99"
      click_on "Create a new book"
      expect(page).to have_content("successfully created")
    end


  end
end
