# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(username: "anthonysurace", password: "testing", age: 30)

Note.create(message: "message in a bottle", user_id: 1)

Note.create(message: "witch queen is going to eat my brain", user_id: 1)

Note.create(message: "oh my legend of arcius comes out soon too", user_id: 1)

User.create(username: "anthonysurace2", password: "testing", age: 30)