require './app'

puts 'Welcome to School Library App'

data = { people: [], books: [] }

def main(data)
  puts ''
  options = 'Please choose an option by entering a number
  1 - List all books
  2 - List all people
  3 - Create a person
  4 - Create a book
  5 - Create a rental
  6 - List all rentals for a given person id
  7 - Exit'

  puts options

  option = gets.chomp

  case option
  when '1'
    App.new.list_all_books(data[:books])
  when '2'
    App.new.list_all_people(data[:people])
  when '3'
    App.new.create_person(data[:people])
  when '4'
    App.new.create_book(data[:books])
  when '5'
    App.new.create_rental(data[:books], data[:people])
  when '6'
    App.new.list_rentals(data[:people])
  when '7'
    puts ''
    puts '=> Thank you for using this app!'
    return
  else
    puts '=> Invalid option!'
  end

  main(data)
end

main(data)
