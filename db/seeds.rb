# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Recipe.destroy_all
Comment.destroy_all

andy = User.create(email: 'andy@andy.com', password: 'password', username: 'bob1')
bob = User.create(email: 'antibob@bob.com', password: 'password', username: 'bob2')
