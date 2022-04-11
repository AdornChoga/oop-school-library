require './student'
require './teacher'

module People
  def list_all_people(people)
    puts 'No person record created yet' if people.empty?
    people.map { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_student(age, name, people)
    print 'Has parent permission to? [Y/N]: '
    permission = gets.chomp.downcase
    permit = ''
    case permission
    when 'y', 'yes'
      permit = true
    when 'n', 'no'
      permit = false
    else
      puts '=> Invalid input for permission'
      return create_student(age, name, people)
    end
    student = Student.new(age, name, permit)
    people << student
    puts 'Person created successfully'
  end

  def create_teacher(age, name, people)
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    people << teacher
    puts 'Person created successfully'
  end

  def create_person(people)
    print 'Do you want to creater a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    case option
    when '1'
      create_student(age, name, people)
    when '2'
      create_teacher(age, name, people)
    end
  end
end
