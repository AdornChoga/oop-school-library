require './classes/book'
require_relative 'data_processing'

module AppBooks
  include ProcessData
  def list_all_books(books)
    puts 'No book added yet' if books.empty?
    books.map { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def create_book(title, author, books)
    book = Book.new(title, author)
    books << book
    book_data = { title: book.title, author: book.author }
    update_data('books', book_data)
    puts 'Book created successfully'
  end
end
