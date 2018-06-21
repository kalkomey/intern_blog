# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

authors = 10.times.map do
  Author.create(
    full_name: Faker::Name.name,
    dob: Faker::Date.birthday(18, 65),
  )
end

20.times do
  Post.create(
    author: authors.sample,
    title: Faker::BackToTheFuture.character,
    body: Faker::BackToTheFuture.quote,
  )
end
