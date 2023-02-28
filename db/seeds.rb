# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require 'open-uri'

I18n.reload!

Booking.destroy_all
Costume.destroy_all
User.destroy_all

  julien = User.create!(
    email: "Julien@lewagon.fr",
    password: "password",
    # encrypted_password: '#$taawktljasktlw4aaglj',
    user_name: "Julien",
    description: "Le grand patron",
    address: Faker::Address.city
  )

  dulcie = User.create!(
    email: "Dulcie@lewagon.fr",
    password: "password",
    # encrypted_password: '#$taawktljasktlw4aaglj',
    user_name: "Dulcie",
    description: "Le front c'est trop bien !",
    address: Faker::Address.city
  )

  mathieu = User.create!(
    email: "Mathieu@lewagon.fr",
    password: "password",
    # encrypted_password: '#$taawktljasktlw4aaglj',
    user_name: "Mathieu",
    description: "Le back c'est trop bien !",
    address: Faker::Address.city
  )

file = URI.open("https://litb-cgis.rightinthebox.com/images/640x853/202109/bps/product/inc/laknyd1630989468948.jpg")
poisson = Costume.new(name: "Sweet Poissons", description: "Homme Sweat à capuche Vert Bleu Marron Noir Capuche Graphic Poissons Imprimer Casual du quotidien 3D effet Vêtement de rue Casual Printemps & Automne Vêtement Tenue Pulls Capuche Pulls molletonnés", price: 50, user: mathieu)
poisson.image.attach(io: file, filename: "poissons.jpg", content_type: "image/png")
poisson.save!

file = URI.open("https://litb-cgis.rightinthebox.com/images/640x640/202101/bps/product/inc/jprvpc1610949407078.jpg")
sweet = Costume.new(name: "Sweet 3D bleu", description: "Sweat à capuche Garçon Enfants manche longue 3D effet Graphic Bleu Enfants Hauts Automne Printemps Frais du quotidien 3-12 ans", price: 20, user: julien)
sweet.image.attach(io: file, filename: "3dbleu.jpg", content_type: "image/png")
sweet.save!

file = URI.open("https://m.media-amazon.com/images/I/616MS6r1lsL._AC_UX522_.jpg")
veste = Costume.new(name: "Veste gothique", description: "keland Veste gothique à épaulettes et gilet plumes naturelles pour homme, fête d'Halloween", price: 100, user: dulcie)
veste.image.attach(io: file, filename: "3dbleu.jpg", content_type: "image/png")
veste.save!

puts "seeding bookings"

Booking.create!(
  user: dulcie,
  costume: poisson,
  start_date: Date.new(2023,3,2),
  end_date: Date.new(2023,3,6),
  status: "confirmed"
)

Booking.create!(
  user: julien,
  costume: poisson,
  start_date: Date.new(2023,3,8),
  end_date: Date.new(2023,3,10),
  status: "pending"
)

Booking.create!(
  user: dulcie,
  costume: poisson,
  start_date: Date.new(2023,3,11),
  end_date: Date.new(2023,3,14),
  status: "pending"
)

Booking.create!(
  user: mathieu,
  costume: veste,
  start_date: Date.new(2023,3,8),
  end_date: Date.new(2023,3,10),
  status: "confirmed"
)

Booking.create!(
  user: julien,
  costume: veste,
  start_date: Date.new(2023,3,16),
  end_date: Date.new(2023,3,18),
  status: "pending"
)

puts "seed done"
