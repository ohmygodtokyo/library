# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning up database..."
# Book.destroy_all
# Collection.destroy_all
# User.destroy_all

puts "Creating default user..."
user = User.create!(
  first_name: "Jimmy",
  last_name: "Dean",
  email: "jd@test.com",
  password: "JD1234"
)

puts "Creating default collection..."
collection = user.collections.create!(
  name: "Fiction"
)

puts "Attaching default image to collection..."
collection.image.attach(io: File.open("app/assets/images/Literary-Fiction-Books-dark-min-1536x864.png"), filename: "Literary-Fiction-Books-dark-min-1536x864.png", content_type: "image/png")

puts "Database seeding has now completed!"
