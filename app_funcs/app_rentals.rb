require './classes/rental'
require_relative 'data_processing'

module AppRentals
  include ProcessData
  def create_rental(data)
    Rental.new(data[:person], data[:book], data[:date])
    rental_details = {
      date: data[:date], book_index: data[:book_index],
      person_index: data[:person_index]
    }
    update_data('rentals', rental_details)
    puts 'Rental Created successfully'
  end

  def list_rentals(person_id, people)
    people.map do |person|
      next unless person.id == person_id.to_i

      puts 'Rentals:'
      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end
end
