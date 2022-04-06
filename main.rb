require './app'

puts 'Welcome to School Library App'

data = { people: [], books: [] }

def main(data)
  puts ''
  puts 'Please choose an option by entering a number'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'

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
    App.new.create_rental
  when '6'
    App.new.list_rentals(10)
  when '7'
    puts ''
    puts '=> Exiting App...'
    return
  else
    puts '=> Invalid option'
  end

  main(data)
end

main(data)
