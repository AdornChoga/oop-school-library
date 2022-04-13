require './app'
require './app_funcs/data_processing'

class Main
  include ProcessData
  def initialize
    @people = populate_people
    @books = populate_books
    @rentals = populate_rentals(@people, @books)
  end

  def get_user_input(messages)
    inputs = []
    messages.each do |msg|
      print "#{msg}: "
      inputs.push(gets.chomp)
    end
    inputs
  end

  def student_permission
    permission = get_user_input(['Has parent permission to? [Y/N]'])[0].downcase
    case permission
    when 'y', 'yes'
      permit = true
    when 'n', 'no'
      permit = false
    else
      puts '=> Invalid input for permission!'
      return student_permission
    end
    permit
  end

  def person_creation
    person_type_msg = 'Do you want to create a student (1) or a teacher (2)? [Input the number]'
    person_type, name, age = get_user_input([person_type_msg, 'Name', 'Age'])
    person_details = { name: name, age: age, stored_people: @people }
    case person_type.to_i
    when 1
      permission = student_permission
      App.new.create_person(person_details, 'student', permission)
    when 2
      specialization = get_user_input(['Specialization'])[0]
      App.new.create_person(person_details, 'teacher', specialization)
    else
      puts 'Invalid input for person type!'
      person_creation
    end
  end

  def book_creation
    title, author = get_user_input(%w[Title Author])
    App.new.create_book(title, author, @books)
  end

  def rental_inputs
    puts 'Select a book from the following list by number'
    @books.map.with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i
    puts ''

    puts 'Select a person from the following list by number'
    @people.map.with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    puts ''

    date = get_user_input(['Date'])[0]
    [book_index, person_index, date]
  end

  def rental_creation
    if @books.empty? & @people.empty?
      puts 'Create book and person first'
    elsif @books.empty?
      puts 'Create book first'
    elsif @people.empty?
      puts 'Create person first'
    else
      book_index, person_index, date = rental_inputs
      data = {
        people: @people, books: @books,
        person_index: person_index, book_index: book_index,
        person: @people[person_index], book: @books[book_index], date: date
      }
      App.new.create_rental(data)
    end
  end

  def rental_listing
    person_id = get_user_input(['ID of person'])[0]
    App.new.list_rentals(person_id, @people)
  end

  def options
    puts ''
    puts 'Please choose an option by entering a number
  1 - List all books
  2 - List all people
  3 - Create a person
  4 - Create a book
  5 - Create a rental
  6 - List all rentals for a given person id
  7 - Exit'
  end

  def select_option(option)
    case option
    when '1'
      App.new.list_all_books(@books)
    when '2'
      App.new.list_all_people(@people)
    when '3'
      person_creation
    when '4'
      book_creation
    when '5'
      rental_creation
    when '6'
      rental_listing
    when '7'
      puts ''
      puts '=> Thank you for using this app!'
    else
      puts '=> Invalid option!'
    end
  end

  def enter_console
    options
    option = gets.chomp
    select_option(option)
    enter_console if option != '7'
  end
end

puts 'Welcome to School Library App'

Main.new.enter_console
