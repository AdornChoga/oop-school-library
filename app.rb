module App
  def list_all_books
    puts 'books'
  end

  def list_all_people
    puts 'all people'
  end

  def create_person
    puts 'create a person'
  end

  def create_book
    puts 'create a book'
  end

  def create_rental
    puts 'create a rental'
  end

  def list_rentals(id)
    puts "rentals for person #{id}"
  end
end