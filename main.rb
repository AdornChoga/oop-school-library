require './app'

def main
  include App
  
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
    App.list_all_books
    main()
  when '2'
    App.list_all_people
    main()
  when '3'
    App.create_person
    main()
  when '4'
    App.create_book
    main()
  when '5'
    App.create_rental
    main()
  when '6'
    App.list_rentals(10)
    main()
  when '7'
    return
  else
    puts 'Invalid option'
    main()
  end
end

main()
