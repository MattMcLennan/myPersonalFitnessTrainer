# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first

faker_confirmation_password = Faker::Internet.password
@user = User.create!(
  name: Faker::Name.name,
  email: Faker::Internet.email,
  password_digest: faker_confirmation_password,
  goal: "gain"
  )

1000.times do
  @meal = Meal.create!(
    food_name: Faker::Name.name,
    calories: Faker::Number.between(20, 500),
    protien: Faker::Number.between(2, 50),
    fat: Faker::Number.between(2, 50),
    carbs: Faker::Number.between(2, 50)
  )

end
