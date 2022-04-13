require './app_funcs/app_books'
require './app_funcs/app_people'
require './app_funcs/app_rentals'

class App
  include AppBooks
  include AppPeople
  include AppRentals
end
