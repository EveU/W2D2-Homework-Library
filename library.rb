# TODO: create library
class Library

  attr_reader :name, :books, :people

  def initialize(name)
    @name = name
    @books = {}
    @people = {}
  end

# TODO: create book
  def add_book(book)
    @books[book.title] = book
  end

# TODO: list books
  def list_books
    if @books.empty?
      "There are no books in the library at present."
    else
      books_string = @books.map { |key, book| book.pretty_string }
      books_string.join("\n\t")
    end
  end

# TODO: create person
  def add_person(person)
    @people[person.name] = person
  end

# TODO: list people
  def list_people
    if @people.empty?
      "There are no people registered with the library at present."
    else
      people_string = @people.map { |key, person| person.pretty_string }
      people_string.join("\n\t")
    end
  end

# TODO: lend book
  def lend_book(person_name, book_title)
    person = @people[person_name]
    book = @books[book_title]
    if book.available?
      @books[book_title] = book.borrow_book(@books[book_title])
      person.borrow(book)
      puts "#{book_title} has been loaned to #{person_name}\n"
    else
      puts "Book unavailable."
    end
  end

# TODO: return book
  def return_book(person_name, book_title)
    person = @people[person_name]
    book = person.return(book_title)
    @books[book_title] = book.return_book(@books[book_title])
  end 

# TODO: list borrowed books
  def list_borrowed_books
    books_borrowed = @people.map { |key, person| person.borrowed_books_string }
    books_borrowed.join("\n")
  end

  # Get user input
  def check_for_person(input_name)
    person_in_library = false
    @people.each do |key, person| 
      if person.name == input_name
        person_in_library =true
      end
    end
    person_in_library
  end

  def check_for_book(book_title)
    book_in_library = false
    @books.each do |key, book| 
      if book.title == book_title
        book_in_library =true
      end
    end
    book_in_library
  end

  def issue_books
    puts "Issue books? (y/n):"
    response = gets.chomp
    while response == "y"
      puts "Who is requesting to take out a book?"
      person_name = gets.chomp.capitalize
      until check_for_person(person_name) == true
        puts "No such person at this library. All people:\n\t#{list_people}"
        puts "Please try again: "
        person_name = gets.chomp.capitalize
      end
      puts "What book would they like to take out?"
      book_title = gets.chomp
      until check_for_book(book_title) == true
        puts "No such book in this library. All books:\n\t#{list_books}"
        puts "Please try again: "
        book_title = gets.chomp
      end
      lend_book(person_name, book_title)
      puts "Issue another book? (y/n):"
      response = gets.chomp
    end
  end

  def return_books
    puts "Return books? (y/n):"
    response = gets.chomp
    while response == "y"
      puts "Who is returning a book?"
      person_name = gets.chomp.capitalize
      puts "What book are they returning?"
      book_title = gets.chomp
      return_book(person_name, book_title)
      puts "Issue another book? (y/n):"
      response = gets.chomp
    end
  end

end