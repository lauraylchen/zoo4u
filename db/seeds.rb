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
user = User.create(email: "test@test.com",
password: "123456",
username: "GoatLover")

puts user.valid?
puts user.errors.messages

# Template for seeding animals
# Set upload path for user image here
# file = URI.open('https://res.cloudinary.com/dtx91va4x/image/upload/v1645550632/happygoat_nkdyjo.jpg')
animal = Animal.create(user: user, 
    name: 'Fluffy',
    animal_type: 'Goat', 
    description: 'Loves to play in the grass!') 

# animal.photo.attach(io: file, filename: 'goat.png', content_type: 'image/png')

#  Use html below to access image where @animals = Animal.all
# <%= cl_image_tag @animals[index].photo.key, height: 300, width: 400, crop: :fill %>

puts animal.valid?
puts animal.errors.messages

# Seeds a booking connected to the above user and animal
booking = Booking.create(user: user,
animal: animal,
start_date: Date.new(2021,10,30),
end_date: Date.new(2022,5,1),
status: 1)

puts booking.valid?
puts booking.errors.messages