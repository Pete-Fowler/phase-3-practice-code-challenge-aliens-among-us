require 'faker'

puts "Seeding ..."

11.times do
  Earthling.create(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    job: Faker::Job.title 
  )

  Alien.create(
    name: Faker::Name.first_name,
    earth_disguise_name: Faker::Name.first_name, 
    home_planet: Faker::Space.planet,
    light_years_to_home_planet: Faker::Space.distance_measurement
  )

  
end

9.times do 
  Visitation.create(
    date: Faker::Date.between(from: '2020-01-01', to: '2022-09-27'), 
    alien_id: Faker::Number.within(range: 1..10), 
    earthling_id: Faker::Number.within(range: 1..10)  
  )
end 

puts "Done seeding!" 