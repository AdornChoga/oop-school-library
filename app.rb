require './student'
require './teacher'

class App
  def list_all_books
    puts 'books'
  end

  def list_all_people(people)
    if people.empty?
      puts 'No person record created yet'
      return
    end
    people.map do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def create_person(people)
    print 'Do you want to creater a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp
    case option
    when '1'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Has parent permission to? [Y/N]: '
      permission = gets.chomp
      yes_answers = %w[y yes]
      no_answers = %w[n no]
      if yes_answers.include? permission.downcase
        student = Student.new(age, name, true)
      elsif no_answers.include? permission.downcase
        student = Student.new(age, name, false)
      else
        puts '=> Invalid input for permission'
        return
      end
      people << student
      puts 'Person created successfully'
    when '2'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp
      teacher = Teacher.new(age, name, specialization)
      people << teacher
      puts 'Person created successfully'
    end
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
