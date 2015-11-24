class Book

  attr_reader :title, :genre
  attr_accessor :status

  def initialize(options = {})
    @title = options[:title]
    @genre = options[:genre]
    @status = "available"
  end

  def pretty_string
    "'#{@title}' is a #{@genre} book. (#{@status})"  
  end

  def available?
    @status == "available"
  end

  def borrow_book(book)
    book.status = "on loan"
    book
  end

  def return_book(book)
    book.status = "available"
    book
  end
  
end

