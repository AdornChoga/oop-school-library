class Rental
  attr_accessor :date, :book, :person

  def initialize(person, book, date)
    @date = date
    @person = person
    @book = book

    person.rentals << self
    book.rentals << self
  end
end
