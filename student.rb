require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, parent_permission)
    super(age, name, parent_permission: parent_permission)
    @classroom = nil
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def add_classroom(classrm)
    @classroom = classrm
    classrm.students.push(self) unless classrm.students.include?(self)
  end
end
