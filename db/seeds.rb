# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
I18n.reload!

5.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "password",
    encrypted_password: "password",
    user_name: Faker::Internet.username,
    description: Faker::Lorem.paragraph,
    address: Faker::Address.city,
  )
  p "user created"
  (0..5).to_a.sample.times do
    Costume.create!(
      name: Faker::Commerce.product_name,
      price: (10..500).to_a.sample,
      description: Faker::Lorem.paragraph,
      costume_rating: (0..5).to_a.sample,
      user_id: user[:id]
    )
  p "costume created"
  end
end
p "seed done"
