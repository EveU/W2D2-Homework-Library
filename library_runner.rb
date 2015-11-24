require "pry-byebug"
require_relative "library"
require_relative "book"
require_relative "person"

# TODO: create library
library = Library.new "Code Clan Library"

# TODO: create book
book_1 = Book.new({title: "Errand", genre: "Fantasy"})
library.add_book(book_1)

library.add_book(Book.new(title: "The Hobbit", genre: "Fantasy"))
library.add_book(Book.new(title: "Feersum Endjinn", genre: "Science Fiction"))
library.add_book(Book.new(title: "Histories", genre: "History"))
library.add_book(Book.new(title: "To Kill a Mockingbird", genre: "Fiction"))
library.add_book(Book.new(title: "A Brief History of Time", genre: "Non-Fiction"))

# TODO: list books
puts "All books: #{library.list_books}"
puts "\n"

# TODO: create person
person_1 = Person.new("Jane")
library.add_person(person_1)
library.add_person(Person.new('Fred'))
library.add_person(Person.new('Wilma'))
library.add_person(Person.new('Barney'))
library.add_person(Person.new('Betty'))

# TODO: list people
puts "All people: #{library.list_people}"
puts "\n"

# TODO: lend book
library.lend_book("Wilma", "The Hobbit")
library.lend_book("Wilma", "Histories")
puts "All books: #{library.list_books}"
puts "\n"
puts "All people: #{library.list_people}"
puts "\n"


# TODO: return book
library.return_book("Wilma", "The Hobbit")
puts "All books: #{library.list_books}"
puts "\n"
puts "All people: #{library.list_people}"
puts "\n"

# TODO: list borrowed books
puts "#{library.list_borrowed_books}\n"


# Get user input
library.issue_books
library.return_books

puts "All books: #{library.list_books}"
puts "\n"

puts "#{library.list_borrowed_books}\n"

binding.pry;""