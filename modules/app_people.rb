require './student'
require './teacher'
require_relative 'get_user_input'

module People
  include UserInput
  def list_all_people(people)
    puts 'No person record created yet' if people.empty?
    people.map { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_student(age, name, people)
    permission = user_input(['Has parent permission to? [Y/N]'])[0].downcase
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
    specialization = user_input(['Specialization'])
    teacher = Teacher.new(age, name, specialization[0])
    people << teacher
    puts 'Person created successfully'
  end

  def create_person(people)
    type_of_person_msg = 'Do you want to creater a student (1) or a teacher (2)? [Input the number]'
    inputs = user_input([type_of_person_msg, 'Age', 'Name'])
    case inputs[0]
    when '1'
      create_student(inputs[1], inputs[2], people)
    when '2'
      create_teacher(inputs[1], inputs[2], people)
    end
  end
end
