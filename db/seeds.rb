# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
zero = Phone.new(name: "iphone", model: "XR", price: 199)
zero.description = Description.new(content: "cool phone, bro!")
zero.rating = Rating.new(number: 3)