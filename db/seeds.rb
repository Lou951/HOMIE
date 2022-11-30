# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
List.destroy_all
User.destroy_all

puts "creating new islands..."

User.create!(email: "john@email.com", password: "password")
List.create!(name: "Home", user: User.first)
User.create!(email: "michael@email.com", password: "password")
List.create!(name: "Home", user: User.second)

puts "created #{User.count} users"
puts "created #{List.count} lists"
