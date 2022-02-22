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

# Template for seeding animals
# Set upload path for user image here
# Commented out for ease of seeding, otherwise takes forever to load
# file = URI.open('https://res.cloudinary.com/dtx91va4x/image/upload/v1645550632/happygoat_nkdyjo.jpg')
animal = Animal.create(user: user, 
    name: 'Fluffy',
    animal_type: 'Goat', 
    description: 'Loves to play in the grass!') 
# animal.photo.attach(io: file, filename: 'goat.png', content_type: 'image/png')

animal2 = Animal.create(user: user, 
    name: 'Rex',
    animal_type: 'Dog', 
    description: 'Loves to chase cats!')

# Seeds a booking connected to the above user and animal
booking = Booking.create(user: user,
animal: animal,
start_date: Date.new(2021,10,30),
end_date: Date.new(2022,5,1),
status: 1)

booking2 = Booking.create(user: user,
    animal: animal2,
    start_date: Date.new(2021,10,30),
    end_date: Date.new(2022,5,1),
    status: 1)





# def validation
#      puts user.valid?
#     puts user.errors.messages
#     puts animal.valid?
#     puts animal.errors.messages
#     puts animal2.valid?
#     puts animal2.errors.messages
#     puts booking.valid?
#     puts booking.errors.messages
#     puts booking2.valid?
#     puts booking2.errors.messages
# end
