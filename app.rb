require './student'
require './teacher'
require './book'
require './rental'

class App
  def list_all_books(books)
    if books.empty?
      puts 'No book added yet'
      return
    end
    books.map do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def list_all_people(people)
    if people.empty?
      puts 'No person record created yet'
      return
    end
    people.map do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person(people)
    print 'Do you want to creater a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp
    case option
    when '1'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Has parent permission to? [Y/N]: '
      permission = gets.chomp
      yes_answers = %w[y yes]
      no_answers = %w[n no]
      if yes_answers.include? permission.downcase
        student = Student.new(age, name, true)
      elsif no_answers.include? permission.downcase
        student = Student.new(age, name, false)
      else
        puts '=> Invalid input for permission'
        return
      end
      people << student
      puts 'Person created successfully'
    when '2'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp
      teacher = Teacher.new(age, name, specialization)
      people << teacher
      puts 'Person created successfully'
    end
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

  def create_rental(books, people)
    if books.empty?
      puts 'Oops! Create a book first'
      return
    end
    if people.empty?
      puts 'Oops! Create a person first'
      return
    end

    puts 'Select a book from the following list by number'
    books.map.with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}"
    end

    book_index = gets.chomp.to_i

    puts ''

    puts 'Select a person from the following list by number'
    people.map.with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_index = gets.chomp.to_i

    puts ''

    print 'Date: '
    date = gets.chomp

    Rental.new(people[person_index], books[book_index], date)
    puts 'Rental Created successfully'
  end

  def list_rentals(id)
    puts "rentals for person #{id}"
  end
end
