require_relative 'component'

class Decorator < Nameable
  def initialize(namable)
    super
    @namable = namable
  end

  def correct_name
    @namable.correct_name
  end
end
