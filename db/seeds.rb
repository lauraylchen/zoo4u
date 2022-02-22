# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning the db..."
Animal.destroy_all
 
animal = Animal.create(name: 'Fluffy',animal_type: 'Goat',description: 'Loves to play in the grass!') 
animal2 = Animal.create(name: 'Fluffy2',animal_type: 'Goat',description: 'Loves to play in the grass!')
