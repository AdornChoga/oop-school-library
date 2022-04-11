require './modules/app_books'
require './modules/app_people'
require './modules/app_rentals'

class App
  include Books
  include People
  include Rentals
end
