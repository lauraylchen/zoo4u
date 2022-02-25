# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Cleaning the db..."
Booking.destroy_all
Animal.destroy_all
User.destroy_all

# User needed to seed the DB
user1 = User.create(
  email: "test@test.com",
  password: "123456",
  username: "Akhyra"
)

user_photo_file_1 = URI.open("https://res.cloudinary.com/dq1xs22hk/image/upload/v1645738601/profile/akhyra_pnj34l.jpg")
user1.photo.attach(io: user_photo_file_1, filename: "avatar1.png", content_type: 'image/jpg')


user2 = User.create(
  email: "test2@test.com",
  password: "123456",
  username: "Cam"
)

user_photo_file_2 = URI.open("https://res.cloudinary.com/dq1xs22hk/image/upload/v1645738592/profile/cameron_zc7loh.jpg")
user2.photo.attach(io: user_photo_file_2, filename: "avatar2.png", content_type: 'image/jpg')

user3 = User.create(
  email: "test3@test.com",
  password: "123456",
  username: "Isabelle"
)

user_photo_file_3 = URI.open("https://res.cloudinary.com/dq1xs22hk/image/upload/v1645738596/profile/isabelle.jpg")
user3.photo.attach(io: user_photo_file_3, filename: "avatar3.png", content_type: 'image/jpg')

user4 = User.create(
  email: "test4@test.com",
  password: "123456",
  username: "Laura"
)

user_photo_file_4 = URI.open("https://res.cloudinary.com/dq1xs22hk/image/upload/v1645738587/profile/laura_fpgj7l.jpg")
user4.photo.attach(io: user_photo_file_4, filename: "avatar4.png", content_type: 'image/jpg')

puts "Users created"
users = [user1, user2, user4]

ozu = Animal.create(
  user_id: user1.id,
  name: 'Ozu',
  animal_type: 'cat',
  description: "I'm a lil girl born on October 22nd, 2020 and I live in Hochelaga. I am very friendly and affectionate.",
  price: 600
)
ozu_file = URI.open("https://res.cloudinary.com/dq1xs22hk/image/upload/v1645640688/animals/ozu_face.jpg")
ozu.photo.attach(io: ozu_file, filename: "ozu_face.jpg", content_type: 'image/jpg')

puts ozu.name

animals_photo = [
  "https://res.cloudinary.com/dq1xs22hk/image/upload/v1645491971/animals/donkey.jpg",
  "https://res.cloudinary.com/dq1xs22hk/image/upload/v1645492268/animals/piggy.jpg",
  "https://res.cloudinary.com/dq1xs22hk/image/upload/v1645491745/animals/lemur.jpg",
  "https://res.cloudinary.com/dq1xs22hk/image/upload/v1645492777/animals/catyawning.jpg",
  "https://res.cloudinary.com/dq1xs22hk/image/upload/v1645493139/animals/oneeyedog.jpg",
  "https://res.cloudinary.com/dq1xs22hk/image/upload/v1645492680/animals/beaver.jpg",
  "https://res.cloudinary.com/dq1xs22hk/image/upload/v1645492563/animals/fennec.jpg",
  "https://res.cloudinary.com/dq1xs22hk/image/upload/v1645491838/animals/rabbits.jpg",
  "https://res.cloudinary.com/dq1xs22hk/image/upload/v1645491426/animals/goat.jpg"
]


# Template for seeding animals
# Set upload path for user image here
animals = ['donkey', 'piggy', 'lemur', 'catyawning', 'oneeyedog', 'beaver', 'fennec', 'rabbits', 'goat' ]
animals_array = animals.map do |animal|
  # file = URI.open("https://res.cloudinary.com/dq1xs22hk/image/upload/v1645492777/animals/#{animal}.jpg")
  file = URI.open(animals_photo[animals.index(animal)])
  animal = Animal.create!(
    user_id: users.sample.id,
    name: Faker::FunnyName.name,
    animal_type: animal,
    description: Faker::Movie.quote,
    price: (200..800).to_a.sample
  )

  animal.photo.attach(io: file, filename: "#{animal}.jpg", content_type: 'image/jpg')

  # puts animal.valid?
  # puts animal.errors.messages
  puts animal.name

  animal
end

mathilde = Animal.create(
  user_id: user4.id,
  name: 'Mathilde',
  animal_type: 'kitten',
  description: "I am a smart kitten and I bite sometimes. Loves playing with my claws!",
  price: 800
)

mathilde_file = URI.open("https://res.cloudinary.com/dq1xs22hk/image/upload/v1645493324/animals/kitten.jpg")
mathilde.photo.attach(io: mathilde_file, filename: "kitten.jpg", content_type: 'image/jpg')

puts mathilde.name

dogcat = Animal.create(
  user_id: user2.id,
  name: "The Fangs Family",
  animal_type: 'catsanddogs',
  description: Faker::Movie.quote,
  price: (200..800).to_a.sample
)

dogcat_file = URI.open("https://res.cloudinary.com/dq1xs22hk/image/upload/v1645492419/animals/catsanddogs.jpg")
dogcat.photo.attach(io: dogcat_file, filename: "catsanddogs.jpg", content_type: 'image/jpg')

puts dogcat.name

puts "Creating bookings"

booking1 = Booking.new(
  start_date: Date.new(2022, 4, 25),
  end_date: Date.new(2022, 5, 1)
)
booking1.user = user1
booking1.animal = animals_array.reject { |animal| animal.user == user1 }[0]
booking1.save!

puts booking1.valid?
puts booking1.errors.messages

booking2 = Booking.new(
  start_date: Date.new(2022, 2, 20),
  end_date: Date.new(2022, 2, 22),
  status: "confirmed"
)
booking2.user = user1
booking2.animal = animals_array.reject { |animal| animal.user == user1 }[1]
booking2.save!

puts booking2.valid?
puts booking2.errors.messages

booking3 = Booking.new(
  start_date: Date.new(2022, 3, 25),
  end_date: Date.new(2022, 3, 26)
)
booking3.user = user2
booking3.animal = animals_array.select { |animal| animal.user == user1 }[0]
booking3.save!

puts booking3.valid?
puts booking3.errors.messages
