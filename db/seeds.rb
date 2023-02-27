# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
I18n.reload!

Costume.destroy_all
User.destroy_all

5.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: "password",
    encrypted_password: "password",
    user_name: Faker::Internet.username,
    description: Faker::Lorem.paragraph,
    address: Faker::Address.city,
  )
  p user
  (0..5).to_a.sample.times do
    costume = Costume.create!(
      name: Faker::Commerce.product_name,
      price: (10..500).to_a.sample,
      description: Faker::Lorem.paragraph,
      costume_rating: (0..5).to_a.sample,
      user_id: user[:id]
    )
  p costume
  end
end
p "seed done"


# require "open-uri"
# require "nokogiri"
# require "json"

# @n ||= 0

# url = "https://www.google.com/search?q=vetements+bizarres&source=lnms&tbm=isch&sa=X&ved=2ahUKEwilk5KMzbb9AhWeTKQEHeVhDPUQ_AUoAXoECAEQAw"

# html_file = URI.open(url)
# html_doc = Nokogiri::HTML.parse(html_file)
# puts "                                            search                                            "
# html_doc.search("#vplap#{@n}.plantl pla-unit-single-clickable-target clickable-card").each do |element|
#   puts @n
#   puts element[0]
#   @n += 1
# end
