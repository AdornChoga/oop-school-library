require './classes/student'
require './classes/teacher'
require_relative 'data_processing'

module AppPeople
  include ProcessData
  def list_all_people(people)
    puts 'No person record created yet' if people.empty?
    people.map { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_person(person_details, person_type, permit = nil, specialization = nil)
    case person_type
    when 'student'
      person = Student.new(person_details[:age], person_details[:name], permit)
      person_details[:stored_people] << person
    when 'teacher'
      person = Teacher.new(person_details[:age], person_details[:name], specialization)
      person_details[:stored_people] << person
    else
      return
    end
    person_data = { id: person.id, name: person.name, age: person.age, class_name: person.class }
    update_data('people', person_data)
    puts "#{person_type.capitalize} created successfully!"
  end
end
