require 'json'

module ProcessData
  def fetch_data(file)
    file_path = "./data/#{file}.json"
    File.new(file_path, 'w+') unless File.exist?(file_path)
    File.write(file_path, '[]') if File.empty?(file_path)
    contents = File.read(file_path)
    JSON.parse(contents)
  end

  def update_data(file, data)
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    stored_data = fetch_data(file)
    stored_data.push(data)
    json_data = JSON.generate(stored_data, opts)
    File.write("./data/#{file}.json", json_data)
  end

  def populate_books
    fetch_data('books').map { |book| Book.new(book['title'], book['author']) }
  end

  def populate_people
    fetch_data('people').map do |person|
      case person['class_name']
      when 'Student'
        Student.new(person['age'], person['parent_permission'], person['name'])
      when 'Teacher'
        Teacher.new(person['specialization'], person['age'], person['name'])
      else
        []
      end
    end
  end

  def populate_rentals(people, books)
    stored_rentals = fetch_data('rentals')
    stored_rentals.map do |rental|
      Rental.new(people[rental['person_index']], books[rental['book_index']], rental['date'])
    end
  end
end
