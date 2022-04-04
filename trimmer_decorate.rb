require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    str = @nameable.correct_name
    str.strip if str.length >= 10
  end
end