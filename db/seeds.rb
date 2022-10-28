def random_paragraph(n=5)
  slist = []
  1.upto(n) do
    slist << random_sentence(rand 5..8)
  end
  slist.join(' ')
end

def random_sentence(n=5)
  wlist = []
  1.upto(n) do 
    wlist << [->() {random_noun}, ->() {random_adj}][rand 0..1].call
  end
  wlist[0][0] = wlist[0][0].upcase
  "#{wlist.join(' ')}."
end

def random_name
  "#{random_noun} #{random_noun}"
end

def random_noun
  RandomWord.nouns.next.split('_').join(' ')
end

def random_adj
  RandomWord.nouns.next.split('_').join(' ')
end

Book.destroy_all

b1 = Book.create!(title: "ESaaS, first edition", pages: 234, publisher: "Strawberry Canyon", year: 2015, list_price: 19.99)
b2 = Book.create!(title: "Moby Dick", pages: 999, publisher: "Unknown", year: 1830, list_price: 9.99)
b3 = Book.create!(title: "The Brothers Karamazov", pages: 1200, publisher: "Unknown", year: 1875, list_price: 12.99)
b4 = Book.create!(title: "Crime and Punishment", pages: 900, publisher: "Unknown", year: 1877, list_price: 10.99)
b5 = Book.create!(title: "What we owe to each other", pages: 432, publisher: "Belknap Press", year: 2000, list_price: 31.39)
b6 = Book.create!(title: "Let's go (so we can get back)", pages: 287, year: 2018, publisher: "Dutton", list_price: 19.19)
b7 = Book.create!(title: "The essential Calvin and Hobbes", pages: 255, year: 1988, publisher: "Andrew and McMeel Books", list_price: 13.13)

# Author name, dob, dod, biography
a1x = Author.create!(name: 'David Patterson', dob: Date.new(1947, 11, 16), biography: random_paragraph)
a1y = Author.create!(name: 'Armando Fox', dob: Date.new(1965, 1, 1), biography: random_paragraph)
b1.authors << a1x
b1.authors << a1y

a2 = Author.create!(name: 'Herman Melville', dob: Date.new(1819, 8, 1), dod: Date.new(1981, 9, 28), biography: random_paragraph)
b2.authors << a2

a3 = Author.create!(name: 'Fyodor Dostoyevsky', dob: Date.new(1821, 11, 11), dod: Date.new(1881, 2, 9), biography: random_paragraph)
b3.authors << a3
b4.authors << a3

a5 = Author.create!(name: 'Timothy Scanlon', dob: Date.new(1940, 6, 28), biography: random_paragraph)
b5.authors << a5

a6 = Author.create!(name: 'Jeff Tweedy', dob: Date.new(1967, 8, 25), biography: random_paragraph)
b6.authors << a6

a7 = Author.create!(name: 'Bill Watterson', dob: Date.new(1958, 7, 5), biography: random_paragraph)
b7.authors << a7

# Review title, review, rating
# ReviewAuthor name, biography
revauthors = []
[b1, b2, b3, b4, b5, b6, b7].each do |book|
  num_reviews = rand 2..10
  1.upto(num_reviews) do 
    if rand(0..3) == 0 || revauthors.empty?
      ra = ReviewAuthor.create!(name: random_name, biography: random_paragraph)
      revauthors << ra
    else
      ra = revauthors[rand 0..(revauthors.length-1)]
    end

    r = Review.create!(title: random_name, review: random_paragraph(2), rating: rand(1..5), review_author: ra, book: book)
  end
end

