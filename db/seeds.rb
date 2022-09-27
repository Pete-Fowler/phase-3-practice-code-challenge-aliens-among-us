10.times do
  Earthling.create(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    job: Faker::job
  )

  Alien.create(
    name: Faker::Name.first
    earth_disguise_name: Faker::Name.first
    home_planet: Faker::Space.planet
    light_years_to_home_planet: Faker::Space.distance_measurement
  )

  Visitation.create(
    date: Faker::Date.between(from: 2020-01-01 to: 2022-09-27)
    alien_id: Faker::Number.unique.non_zero_digit
    earthling_id: Faker::Number.unique.non_zero_digit
  )
end