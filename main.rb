require './app'

puts 'Welcome to School Library App'

data = { people: [], books: [] }

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

def select_option(option, data)
  case option
  when '1'
    Books.new.list_all_books(data[:books])
  when '2'
    People.new.list_all_people(data[:people])
  when '3'
    People.new.create_person(data[:people])
  when '4'
    Books.new.create_book(data[:books])
  when '5'
    Rentals.new.create_rental(data[:books], data[:people])
  when '6'
    Rentals.new.list_rentals(data[:people])
  when '7'
    puts ''
    puts '=> Thank you for using this app!'
  else
    puts '=> Invalid option!'
  end
end

def main(data)
  options
  option = gets.chomp
  select_option(option, data)
  main(data) if option != '7'
end

main(data)
