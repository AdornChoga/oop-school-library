require_relative 'spec_helper'

describe Rental do
  before :each do
    @john = Person.new(20, 'John')
    @book = Book.new('Lightning', 'Dean Kutz')
    @rental = Rental.new(@john, @book, '2022-04-13')
  end

  it 'should be the instance of Rental' do
    expect(@rental).to be_instance_of Rental
  end

  context 'Testing of the instance variables of Rental' do
    it 'should have a person' do
      person = @rental.person
      expect(person).to be @john
    end
    it 'should have a person' do
      book = @rental.book
      expect(book).to be @book
    end
    it 'should have a date' do
      date = @rental.date
      expect(date).to eq '2022-04-13'
    end
  end
  context 'Testing the rentals of person and book' do
    it 'should append the current rental into person rentals' do
      person_rental = @john.rentals
      expect(person_rental).to include(@rental)
    end
    it 'should append the current rental into book rentals' do
      book_rental = @book.rentals
      expect(book_rental).to include(@rental)
    end
  end
end
