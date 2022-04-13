require_relative 'spec_helper'

describe Student do
  before :each do
    @adorn = Student.new(20, 'Adorn', true)
  end

  it 'should be the instance of Student class' do
    expect(@adorn).to be_instance_of Student
  end

  context 'Testing the instance variables' do
    it 'should have the name' do
      name = @adorn.name
      expect(name).to eq 'Adorn'
    end

    it 'should have the age' do
      age = @adorn.age
      expect(age).to eq 20
    end

    it 'should have the parent_permission' do
      permit = @adorn.parent_permission
      expect(permit).to be_truthy
    end

    it 'should have the classroom' do
      classroom = @adorn.classroom
      expect(classroom).to be_nil
    end
  end
  context 'Testing the methods of Student' do
    it 'should return ¯\(ツ)/¯' do
      play = @adorn.play_hooky
      expect(play).to eq "¯\(ツ)/¯"
    end

    it 'should add classroom of student' do
      classrm = Classroom.new(14)
      @adorn.add_classroom(classrm)
      croom = @adorn.classroom
      expect(croom).to be classrm
    end
  end
end
