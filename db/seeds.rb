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
user1 = User.create(
  email: "test@test.com",
  password: "123456",
  username: "GoatLover"
)

user2 = User.create(
  email: "test2@test.com",
  password: "123456",
  username: "CatLover"
)

user3 = User.create(
  email: "test3@test.com",
  password: "123456",
  username: "DonkeyLover"
)

user4 = User.create(
  email: "test4@test.com",
  password: "123456",
  username: "PiggyLover"
)

users = [user1, user2, user3, user4]
animals_photo = [
  "https://res.cloudinary.com/dq1xs22hk/image/upload/v1645491971/animals/donkey.jpg",
  "https://res.cloudinary.com/dq1xs22hk/image/upload/v1645492268/animals/piggy.jpg",
  "https://res.cloudinary.com/dq1xs22hk/image/upload/v1645491745/animals/lemur.jpg",
  "https://res.cloudinary.com/dq1xs22hk/image/upload/v1645493324/animals/catyelling.jpg",
  "https://res.cloudinary.com/dq1xs22hk/image/upload/v1645493139/animals/oneeyedog.jpg",
  "https://res.cloudinary.com/dq1xs22hk/image/upload/v1645492777/animals/catyawning.jpg",
  "https://res.cloudinary.com/dq1xs22hk/image/upload/v1645492680/animals/beaver.jpg",
  "https://res.cloudinary.com/dq1xs22hk/image/upload/v1645492563/animals/fennec.jpg",
  "https://res.cloudinary.com/dq1xs22hk/image/upload/v1645492419/animals/catsanddogs.jpg",
  "https://res.cloudinary.com/dq1xs22hk/image/upload/v1645491838/animals/rabbits.jpg",
  "https://res.cloudinary.com/dq1xs22hk/image/upload/v1645491426/animals/goat.jpg",
  "https://res.cloudinary.com/dq1xs22hk/image/upload/v1645490864/animals/Ozu_in_jean_jacket.png"
]

# Template for seeding animals
# Set upload path for user image here
animals = ['donkey', 'piggy', 'lemur', 'catyelling', 'oneeyedog', 'catyawning', 'beaver', 'fennec', 'catsanddogs', 'rabbits', 'goat', 'ozu_in_jean_jacket' ]
animals.each do |animal|
  # file = URI.open("https://res.cloudinary.com/dq1xs22hk/image/upload/v1645492777/animals/#{animal}.jpg")
    file = URI.open(animals_photo[animals.index(animal)])
    animal = Animal.create!(
    user_id: users.sample.id,
    name: Faker::Creature::Animal.name,
    animal_type: animal,
    description: Faker::Quote.yoda,
    price: (200..800).to_a.sample
  )

  animal.photo.attach(io: file, filename: "#{animal}.png", content_type: 'image/png')

  # puts animal.valid?
  # puts animal.errors.messages
    puts Animal.last.name
end

15.times do
  Booking.create(
    user_id: users.sample.id,
    animal_id: rand(Animal.count),
    start_date: Date.new(2021, 10, 30),
    end_date: Date.new(2022, 5, 1),
    status: "pending"
  )
end
