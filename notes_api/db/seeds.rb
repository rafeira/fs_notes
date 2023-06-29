# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

rafael = User.create!(
  email: 'rafael@email.com',
  first_name: 'Rafael',
  last_name: 'Vieira',
  password: '123456'
)

10.times do
  Note.create!(
    title: Faker::Lorem.sentence(word_count: 5),
    content: Faker::Lorem.paragraph(sentence_count: 90),
    author: rafael
  )
end
