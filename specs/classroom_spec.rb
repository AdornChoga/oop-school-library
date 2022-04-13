require_relative 'spec_helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new(14)
  end

  it 'created classroom should instance of Classroom class' do
    expect(@classroom).to be_instance_of(Classroom)
  end

  context 'testing availability and accessibility of attributes' do
    it 'should have label attribute' do
      label = @classroom.label
      expect(label).to eq 14
    end

    it 'should have classroom attribute' do
      students = @classroom.students
      expect(students).to eq []
    end
  end

  context 'testing classroom properties' do
    it 'should append student to the classroom students array' do
      students = @classroom.students.size
      student = Student.new(20, 'Adorn', true)
      @classroom.add_student = student
      new_students = @classroom.students.size
      expect(new_students).to eq students + 1
    end

    it "should append classroom to the student's classroom" do
      student = Student.new(20, 'Adorn', true)
      @classroom.add_student = student
      student_classroom = student.classroom
      expect(student_classroom).to eq @classroom
    end
  end
end
