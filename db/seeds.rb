# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
List.destroy_all
User.destroy_all

puts "creating new users and lists..."

lists = ["Home", "Parents", "Office", "Restaurant"]

i = 1
10.times do
  user = User.create!(email: "user#{i}@email.com", password: "password")
  List.create!(name: lists.sample, user_id: user.id)
  i += 1
end

puts "created #{User.count} users"
puts "created #{List.count} lists"
