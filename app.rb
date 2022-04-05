class App
  def list_all_books
    'books'
  end

  def list_all_people
    'all people'
  end

  def create_person
    'create a person'
  end

  def create_book
    'create a book'
  end

  def create_rental
    'create a rental'
  end

  def list_rentals(id)
    "rentals for person #{id}"
  end
end