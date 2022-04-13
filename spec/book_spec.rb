require_relative 'spec_helper'

describe Book do
  before :each do
    @book = Book.new('Lightning', 'Dean Kutz')
  end

  it 'book should be an instance of Book class' do
    expect(@book).to be_instance_of(Book)
  end

  context 'testing availability and accessibility of attributes' do
    it 'should have title attribute' do
      title = @book.title
      expect(title).to eq 'Lightning'
    end

    it 'should have author attribute' do
      author = @book.author
      expect(author).to eq 'Dean Kutz'
    end

    it 'should have rentals attribute' do
      rentals = @book.rentals
      expect(rentals).to eq []
    end
  end

  context 'testing book properties' do
    it 'should append rental to the book rentals' do
      @john = Person.new(20, 'John')
      @book.add_rental(@john, '2022-04-13')
      rentals = @book.rentals.size
      expect(rentals).to eq 2
    end
  end
end
