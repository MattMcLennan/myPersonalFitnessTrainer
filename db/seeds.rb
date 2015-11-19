# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first

# require 'csv'
#
# csv_text = File.read('Paleo Diet - Sheet1.csv')
# csv = CSV.parse(csv_text, :headers => true)
# csv.each do |row|
#   Meal.create!(row.to_hash)
# end
#
# bench = 115
# deadlift = 180
# squat = 150
# overhead_press = 40
# barbell_row = 75
#
# 30.times do
#   bench += 2
#   deadlift += 3
#   squat += 3
#   overhead_press += 1
#   barbell_row += 1
#
#   Exercise.create!(
#     user_id: 1,
#     bench: bench,
#     deadlift: deadlift,
#     squat: squat,
#     overhead_press: overhead_press,
#     barbell_row: barbell_row,
#     bench_reps: 5,
#     deadlift_reps: 5,
#     squat_reps: 5,
#     overhead_press_reps: 5,
#     barbell_row_reps: 5
#   )
# end
#
# i = 31
# Exercise.all.each do |exercise|
#   i -= 1
#   exercise.created_at = (i).days.ago
#   exercise.save!
# end
