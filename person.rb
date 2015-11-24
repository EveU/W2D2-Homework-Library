class Person

  attr_reader :name, :books

  def initialize(name)
    @name = name
    @books = {}
  end

  def pretty_string
    "'#{@name}' currently has #{@books.size} books on loan."
  end

  def borrow(book)
    @books[book.title] = book
  end

  def return(book_title)
    @books.delete(book_title)
  end

  def borrowed_books
     @books.map { |key, book| book.title }
  end

  def borrowed_books_string
    if borrowed_books == []
      puts "No books on loan to #{name}"
    else
      "#{borrowed_books.join(", ")} currently on loan to #{@name}."
    end
  end

end
