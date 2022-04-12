require './rental'

module Rentals
  include UserInput
  def rentals_input(books, people)
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

    date = user_input(['Date'])[0]
    [person_index, book_index, date]
  end

  def add_rental(books, people)
    inputs = rentals_input(books, people)
    Rental.new(people[inputs[0]], books[inputs[1]], inputs[2])
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
