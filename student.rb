require_relative 'person'

class Student < Person
  def initialize(classroom)
    super
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom(classrm)
    @classroom = classrm
    classrm.push(self) unless classrm.students.include?(self)
  end
end
