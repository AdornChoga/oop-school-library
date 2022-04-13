require_relative 'spec_helper'

describe Teacher do
  before :each do
    @hammas = Teacher.new(22, 'Hammas', 'SQL')
  end

  it 'should be the instance of Teacher' do
    expect(@hammas).to be_instance_of Teacher
  end

  context 'Testing instance variables of Teacher' do
    it 'should have the name' do
      name = @hammas.name
      expect(name).to eq 'Hammas'
    end

    it 'should have the age' do
      age = @hammas.age
      expect(age).to eq 22
    end
  end

  context 'Testing the methods of Teacher' do
    it 'should return true for age above 18' do
      service_usage = @hammas.can_use_services?
      expect(service_usage).to be_truthy
    end
  end
end
