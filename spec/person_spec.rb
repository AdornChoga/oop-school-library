require_relative 'spec_helper'

describe Person do
  before :each do
    @john = Person.new(20, 'John')
  end

  it 'created object should instance of Person class' do
    expect(@john).to be_instance_of(Person)
  end

  context 'testing availability and accessibility of attributes' do
    it 'person object should contain age attribute' do
      age = @john.age
      expect(age).to eq 20
    end

    it 'person object should contain name attribute' do
      name = @john.name
      expect(name).to eq 'John'
    end

    it 'person object should contain parent_permission attribute' do
      permit = @john.parent_permission
      expect(permit).to be_truthy
    end

    it 'person object should contain rentals attribute' do
      rentals = @john.rentals
      expect(rentals).to eq []
    end
  end

  context 'testing functionality of Person methods' do
    it 'should return true for age above 18' do
      service_usage = @john.can_use_services?
      expect(service_usage).to be_truthy
    end

    it 'should return false for age below 18' do
      jane = Person.new(17, 'Jane')
      service_usage = jane.can_use_services?
      expect(service_usage).to be_falsy
    end

    it 'should return name of person' do
      correct_name = @john.correct_name
      expect(correct_name).to eq 'John'
    end

    it "should append one rental to john's rentals" do
      book = Book.new('Lightning', 'Dean Kutz')
      @john.add_rental(book, '2022-04-13')
      rental_size = @john.rentals.size
      expect(rental_size).to eq 2
    end
  end
end
