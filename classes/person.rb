require './decorators/person/correct_name'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @rentals = []
    @parent_permission = parent_permission
  end

  def add_rental(book, date)
    @rentals << Rental.new(self, book, date)
  end

  def can_use_services?
    of_age?
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
