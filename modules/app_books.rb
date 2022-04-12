require './book'
require_relative 'get_user_input'

module Books
  include UserInput
  def list_all_books(books)
    puts 'No book added yet' if books.empty?
    books.map { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def create_book(books)
    inputs = user_input(%w[Title Author])
    book = Book.new(inputs[0], inputs[1])
    books << book
    puts 'Book created successfully'
  end
end
