require 'rails_helper'

RSpec.describe 'Flights Index Page' do
  before :each do 
    @american = Airline.create!(name: "American")
    @delta = Airline.create!(name: "Delta")
    @smelta = Airline.create!(name: "Smelta")
    @flight1 = Flight.create!(number: 7990, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas", airline_id: @american.id)
    @flight2 = Flight.create!(number: 3940, date: "3/10/2022", departure_city: "Detriot", arrival_city: "Orlando", airline_id: @american.id)
    @flight3 = Flight.create!(number: 9091, date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City", airline_id: @delta.id)
    @passenger1 = Passenger.create!(name: "Tina Belcher")
    @passenger2 = Passenger.create!(name: "Linda Belcher")
    @passenger3 = Passenger.create!(name: "Louise Belcher")
    @joins1 = FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger1.id)
    @joins2 = FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @passenger2.id)
    @joins3 = FlightPassenger.create!(flight_id: @flight3.id, passenger_id: @passenger3.id)
  end 

  it 'lists all flight numbers, as well as the name of the airline the flight belongs to' do 
    visit flights_path
    save_and_open_page
    expect(page).to have_content(@american.name)
    expect(page).to have_content(@delta.name)
    expect(page).to have_no_content(@smelta.name)
    expect(page).to have_content(@flight1.id)
    expect(page).to have_content(@flight2.id)
    expect(page).to have_content(@flight3.id)
  end
end 