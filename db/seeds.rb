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

User.destroy_all
Costume.destroy_all


  user = User.create!(
    email: "Julien@lewagon.fr",
    password: "password",
    # encrypted_password: '#$taawktljasktlw4aaglj',
    user_name: "Julien",
    description: "Le grand patron",
    address: Faker::Address.city
  )

  user = User.create!(
    email: "Dulcie@lewagon.fr",
    password: "password",
    # encrypted_password: '#$taawktljasktlw4aaglj',
    user_name: "Dulcie",
    description: "Le front c'est trop bien !",
    address: Faker::Address.city
  )

  user = User.create!(
    email: "Mathieu@lewagon.fr",
    password: "password",
    # encrypted_password: '#$taawktljasktlw4aaglj',
    user_name: "Mathieu",
    description: "Le back c'est trop bien !",
    address: Faker::Address.city
  )

file = URI.open("https://litb-cgis.rightinthebox.com/images/640x853/202109/bps/product/inc/laknyd1630989468948.jpg")
costume = Costume.new(name: "Sweet Poissons", description: "Homme Sweat à capuche Vert Bleu Marron Noir Capuche Graphic Poissons Imprimer Casual du quotidien 3D effet Vêtement de rue Casual Printemps & Automne Vêtement Tenue Pulls Capuche Pulls molletonnés", price: 50, user_id: 1)
costume.image.attach(io: file, filename: "poissons.jpg", content_type: "image/png")
costume.save!

file = URI.open("https://litb-cgis.rightinthebox.com/images/640x640/202101/bps/product/inc/jprvpc1610949407078.jpg")
costume = Costume.new(name: "Sweet 3D bleu", description: "Sweat à capuche Garçon Enfants manche longue 3D effet Graphic Bleu Enfants Hauts Automne Printemps Frais du quotidien 3-12 ans", price: 20, user_id: 2)
costume.image.attach(io: file, filename: "3dbleu.jpg", content_type: "image/png")
costume.save!

file = URI.open("https://m.media-amazon.com/images/I/616MS6r1lsL._AC_UX522_.jpg")
costume = Costume.new(name: "Veste gothique", description: "keland Veste gothique à épaulettes et gilet plumes naturelles pour homme, fête d'Halloween", price: 100, user_id: 3)
costume.image.attach(io: file, filename: "3dbleu.jpg", content_type: "image/png")
costume.save!

p "seed done"
