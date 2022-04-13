require_relative 'spec_helper'

describe 'Tests for correcting name functionality' do
  before :each do
    @person = Person.new(20, 'maximilianus')
    @capitalized_name = CapitalizeDecorator.new(@person)
  end

  it "should capitalize person's name" do
    capitalized_name = @capitalized_name.correct_name
    expect(capitalized_name).to eql 'Maximilianus'
  end

  it "should trim person's name" do
    trimmed_name = TrimmerDecorator.new(@capitalized_name)
    trimmed_name = trimmed_name.correct_name
    expect(trimmed_name).to eql 'Maximilian'
  end
end
