class Airline < ApplicationRecord
  has_many :flights
  has_many :flight_passengers, through: :flights
  has_many :passengers, through: :flight_passengers

  def adult_passengers
    passengers.return_adults
  end 
end