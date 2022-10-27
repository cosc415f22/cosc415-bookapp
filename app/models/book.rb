class Book < ApplicationRecord
  has_many :reviews
  has_and_belongs_to_many :authors

  def self.title_search(string)
    Book.where("title like ?", "%#{string}%")
  end
end
