require './book'

module Books
  def list_all_books(books)
    puts 'No book added yet' if books.empty?
    books.map { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def create_book(books)
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    books << book
    puts 'Book created successfully'
  end
end
