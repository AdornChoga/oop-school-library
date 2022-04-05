require_relative 'person'

class Student < Person
  attr_reader :classroom
  def initialize(age, name)
    super(age, name)
    @classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def add_classroom(classrm)
    @classroom = classrm
    classrm.students.push(self) unless classrm.students.include?(self)
  end
end
