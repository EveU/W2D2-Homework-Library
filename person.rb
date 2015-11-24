class Person

  attr_reader :name, :books

  def initialize(name)
    @name = name
    @books = {}
  end

  def pretty_string
    "'#{@name}' has #{@books.size} books borrowed at the moment."
  end

  def borrow(book)
    @books[book.title] = book
  end

  def return(book_title)
    @books.delete(book_title)
  end

  def borrowed_books
     books_on_loan = @books.map { |key, book| book.title }
     books_on_loan
  end

  def borrowed_books_string
    if borrowed_books == []
      puts "No books on loan to #{name}"
    else
      "#{borrowed_books.join(", ")} currently on loan to #{@name}."
    end
  end

end
