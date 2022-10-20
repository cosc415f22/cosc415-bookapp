require 'rails_helper'

RSpec.describe Book, type: :model do
  before (:each) do
    @book1 = Book.create(title: "Book1")
    @book2 = Book.create(title: "Book2")
  end

  context "title search" do
    it "should correctly retrieve when no records match" do
      expect(Book.title_search("look")).to eq([])
    end

    it "should correctly retrieve when one record matches" do
      expect(Book.title_search("Book1")).to eq([@book1])
    end

    it "should correctly retrieve when multiple records match" do
      expect(Book.title_search("Book")).to eq([@book1, @book2])
    end
  end
end
