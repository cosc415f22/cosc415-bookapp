class Book < ApplicationRecord
  has_many :reviews

  def self.title_search(string)
    Book.where("title like ?", "%#{string}%")
  end
end
