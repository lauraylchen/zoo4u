# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Cleaning the db..."
Animal.destroy_all
User.destroy_all

# User needed to seed the DB
user = User.create(
  email: "test@test.com",
  password: "123456",
  username: "GoatLover"
)

# Template for seeding animals
# Set upload path for user image here
animals = ['donkey', 'piggy', 'lemur']
animal_array = []
animals.each do |animal|
  # file = URI.open("https://res.cloudinary.com/dtx91va4x/image/upload/v1645550632/#{animal}.jpg")
  file = URI.open("https://res.cloudinary.com/dq1xs22hk/image/upload/v1645491745/animals/lemur.jpg")
  animal = Animal.create(
    user_id: user.id,
    name: Faker::Creature::Animal.name,
    animal_type: animal,
    description: Faker::Quote.yoda
  )

  animal.photo.attach(io: file, filename: "#{animal}.png", content_type: 'image/png')

  puts animal.valid?
  puts animal.errors.messages
  animal_array.push(animal)
end


booking = Booking.create(user: user,
  animal: animal_array[0],
  price: 300,
  start_date: Date.new(2021,10,30),
  end_date: Date.new(2022,5,1),
  status: 1)
  booking2 = Booking.create(user: user,
      animal: animal_array[1],
      price: 600,
      start_date: Date.new(2021,10,30),
      end_date: Date.new(2022,5,1),
      status: 1)
