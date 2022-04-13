require './book'

module AppBooks
  def list_all_books(books)
    puts 'No book added yet' if books.empty?
    books.map { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def create_book(title, author, books)
    book = Book.new(title, author)
    books << book
    puts 'Book created successfully'
  end
end
