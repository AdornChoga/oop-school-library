require './classes/student'
require './classes/teacher'

module AppPeople
  def list_all_people(people)
    puts 'No person record created yet' if people.empty?
    people.map { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_person(person, person_type, permit = nil, specialization = nil)
    case person_type
    when 'student'
      student = Student.new(person[:age], person[:name], permit)
      person[:stored_people] << student
    when 'teacher'
      teacher = Teacher.new(person[:age], person[:name], specialization)
      person[:stored_people] << teacher
    else
      return
    end
    puts "#{person_type.capitalize} created successfully!"
  end
end
