require './student'
require './teacher'
require './book'
require './rental'

class Books
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

class People
  def list_all_people(people)
    puts 'No person record created yet' if people.empty?
    people.map { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_student(age, name, people)
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
  end

  def create_teacher(age, name, people)
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    people << teacher
    puts 'Person created successfully'
  end

  def create_person(people)
    print 'Do you want to creater a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    case option
    when '1'
      create_student(age, name, people)
    when '2'
      create_teacher(age, name, people)
    end
  end
end

class Rentals
  def add_rental(books, people)
    puts 'Select a book from the following list by number'
    books.map.with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
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

  def create_rental(books, people)
    if books.empty? & people.empty?
      puts 'Create book and person'
    elsif books.empty?
      puts 'Create book first'
    elsif people.empty?
      puts 'Create person first'
    else
      add_rental(books, people)
    end
  end

  def list_rentals(people)
    print 'ID of person: '
    person_id = gets.chomp
    people.map do |person|
      next unless person.id == person_id.to_i

      puts 'Rentals:'
      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end
end
