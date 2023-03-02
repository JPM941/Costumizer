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

Review.destroy_all
Booking.destroy_all
Costume.destroy_all
User.destroy_all

puts "seeding users..."

file = URI.open("https://medias.spotern.com/spots/w640/333/333700-1589526457.jpg")
julien = User.new(
  email: "Julien@lewagon.fr",
  password: "password",
  # encrypted_password: '#$taawktljasktlw4aaglj',
  user_name: "Julien",
  description: "Le grand patron",
  address: "Paris 1er"
)
julien.avatar.attach(io: file, filename: "julien.jpg", content_type: "image/png")
julien.save!

file = URI.open("https://www.nextplz.fr/wp-content/uploads/nextplz/2019/05/cristianadellanna_official_57072731_442090446558610_5710319716844065195_n-e1557135141639.jpg")
dulcie = User.create!(
  email: "Dulcie@lewagon.fr",
  password: "password",
  # encrypted_password: '#$taawktljasktlw4aaglj',
  user_name: "Dulcie",
  description: "Le front c'est trop bien !",
  address: "Paris 19ème"
)
dulcie.avatar.attach(io: file, filename: "dulcie.jpg", content_type: "image/png")
dulcie.save!


file = URI.open("https://thumb.canalplus.pro/http/unsafe/%7BresolutionXY%7D/smart/creativemedia-image.canalplus.pro/content/0001/41/fc5d5c03f7369a88844382d2f6e98c84716d4561.jpeg")
mathieu = User.new(
  email: "Mathieu@lewagon.fr",
  password: "password",
  # encrypted_password: '#$taawktljasktlw4aaglj',
  user_name: "Mathieu",
  description: "Le back c'est trop bien !",
  address: "Saint-denis"
)
mathieu.avatar.attach(io: file, filename: "mathieu.jpg", content_type: "image/png")
mathieu.save!

puts "seeded #{User.count} users"

puts "seeding costumes..."
file = File.open("app/assets/images/seed/microdose.jpg")
microdose = Costume.new(name: "Microdose", description:"This mushroom costume is perfect for anyone who wants to add a touch of whimsy and playfulness to their wardrobe. The costume features a large, mushroom-shaped tunic with a stem and cap design, complete with realistic detailing and vibrant colors. The plush and soft material ensures that the costume is comfortable to wear, making it perfect for a night out or a costume party. The costume also includes a matching headpiece with attached mushroom cap, adding the perfect finishing touch to your ensemble. Whether you're heading out to a woodland-themed party or simply looking to add some fun to your wardrobe, this mushroom costume is the perfect choice. Get ready to take on the world with a touch of whimsy and a whole lot of fun!", price: 33, user: dulcie)
microdose.images.attach(io: file, filename: "microdose.jpg", content_type: "image/png")
microdose.address = microdose.user.address
microdose.save!

file = URI.open("https://cdn.shopify.com/s/files/1/0589/6667/1535/products/mens-octopus-ls2_bde7f583-8946-48e5-8ebd-bd5505ef0460.jpg?v=1661193334&width=2000")
octopus = Costume.new(name: "Octopus", description: "Who has eight thumbs and loves beer? Not you, because octopi don't have thumbs. It's time you went back to biology and learned about cephalopods (stop giggling; that's a species) with the Men's Octopus Costume. This teal green jumpsuit zips up for a quick costume that also shows your undying respect for sea life. The extra arms feature soft suckers, so you won't get caught on anything as you float through the party, and the hood keeps eyes in the back of your head. The entire suit is made from quality materials and should probably be in a museum somewhere because it's so beautiful. We digress. Whether or not you're a zoologist, you can still make a splash at this year's Halloween party in the Men's Octopus Costume. You'll go from calamari to cali-MANly with so many extra arms to flex (octopi don't have biceps either, genius).", price: 27, user: mathieu)
octopus.images.attach(io: file, filename: "octopus.jpg", content_type: "image/png")
octopus.address = octopus.user.address
octopus.save!

file = File.open("app/assets/images/seed/panther.jpg")
panther = Costume.new(name: "Panther", description: "This weird panther costume is sure to make a bold and edgy statement wherever you go. The costume features a sleek and shiny black bodysuit with intricate panther details, including a realistic panther face hood complete with sharp teeth and piercing yellow eyes. The bodysuit is made of high-quality materials, ensuring durability and comfort, while the unique design is both bold and eye-catching. The costume also includes long, curved claws that attach to your hands, adding a touch of realism to your overall look. Whether you're heading out to a Halloween party or simply looking to add some fierce style to your wardrobe, this weird panther costume is sure to turn heads and create a sense of intrigue. So get ready to unleash your wild side and embrace your inner panther with this one-of-a-kind costume.", price: 41, user: dulcie)
panther.images.attach(io: file, filename: "panther.jpg", content_type: "image/png")
panther.address = panther.user.address
panther.save!

file = File.open("app/assets/images/seed/pig.jpg")
pig = Costume.new(name: "Pig", description: "This weird pig costume is perfect for anyone who wants to embrace their playful and whimsical side. The costume features a bright pink bodysuit with a plush and fluffy design that is both comfortable and cozy. The hood of the bodysuit features a realistic pig face complete with pointy ears and a cute snout. The bodysuit is designed with a unique twist, featuring a set of large wings attached to the back, giving the costume an intriguing and fantastical feel. Whether you're heading out to a costume party or simply looking to add some fun to your wardrobe, this weird pig costume is sure to make a statement. So embrace your inner pig and let the fun begin!", price: 38, user: julien)
pig.images.attach(io: file, filename: "pig.jpg", content_type: "image/png")
pig.address = pig.user.address
pig.save!

file = URI.open("https://litb-cgis.rightinthebox.com/images/640x853/202109/bps/product/inc/laknyd1630989468948.jpg")
poisson = Costume.new(name: "Fish sweat", description: "This hoodie is perfect for nature and sea lovers. The fish patterns that adorn the fabric make it a unique and trendy garment. The different shades of blue and green evoke the colors of the ocean, creating an atmosphere of tranquility and serenity. The soft and comfortable fabric is ideal for relaxing at home or for a casual day out. The hood keeps you warm when the temperature drops, while the adjustable drawstrings allow you to customize the look to your liking. Whether you're a fishing enthusiast or simply a lover of marine life, this hoodie will allow you to make a bold and inspired style statement.", price: 50, user: mathieu)
poisson.images.attach(io: file, filename: "poissons.jpg", content_type: "image/png")
poisson.address = poisson.user.address
poisson.save!

file = URI.open("https://litb-cgis.rightinthebox.com/images/640x640/202101/bps/product/inc/jprvpc1610949407078.jpg")
sweet = Costume.new(name: "3D sweat", description: "This hoodie is a true work of art, designed to stand out from the crowd. The unique 3D hole printing creates a stunning illusion that looks like a hole has been torn through the fabric. The design is both edgy and sophisticated, with a modern feel that is sure to turn heads. The blue fabric is sleek and understated, allowing the bold 3D printing to take center stage. The comfortable and soft material makes it perfect for casual wear or lounging at home. The hoodie is finished with a drawstring hood that can be adjusted for the perfect fit. With its bold and creative design, this hoodie is a must-have for anyone who loves to make a statement with their fashion choices.", price: 20, user: julien)
sweet.images.attach(io: file, filename: "3dbleu.jpg", content_type: "image/png")
sweet.address = sweet.user.address
sweet.save!

file = URI.open("https://m.media-amazon.com/images/I/616MS6r1lsL._AC_UX522_.jpg")
veste = Costume.new(name: "Gothic jacket", description: "This gothic jacket is the perfect choice for those who want to make a bold and edgy fashion statement. The black fabric creates a sleek and sophisticated look, while the intricate details give it a gothic flair. The jacket is adorned with metal studs and zippers that add to its tough and rebellious vibe. The unique and detailed designs on the back of the jacket showcase the wearer's individuality and add to the overall gothic aesthetic. The high-quality materials and construction ensure durability and comfort, making it the perfect jacket for any occasion. Whether you're heading out for a night on the town or just looking to express your dark side, this gothic jacket is a must-have for any fashion-forward wardrobe.", price: 100, user: dulcie)
veste.images.attach(io: file, filename: "3dbleu.jpg", content_type: "image/png")
veste.address = veste.user.address
veste.save!

file = URI.open("https://cdn.shopify.com/s/files/1/0323/6410/1676/products/CF861519_A1.jpg?v=1632982053")
alice = Costume.new(name: "Alice in Wonderland", description: "This Alice in Wonderland costume is perfect for those who want to step into the whimsical world of the classic tale. The blue dress features a puffy skirt with a white apron and black ribbon accents, just like the iconic outfit worn by Alice in the story. The dress is made of high-quality materials that are both durable and comfortable, making it perfect for all-day wear. The included headband features a black bow, adding a touch of playfulness and elegance to the costume. With its classic design and attention to detail, this Alice in Wonderland costume is sure to make you feel like you've stepped straight into the storybook pages. Whether you're attending a costume party or putting on a play, this costume is the perfect choice for any Alice in Wonderland fan.", price: 70, user: dulcie)
alice.images.attach(io: file, filename: "alice.jpg", content_type: "image/png")
alice.address = alice.user.address
alice.save!

file = URI.open("https://cdn.deguisetoi.fr/images/rep_art/gra/225/4/225453/deguisement-humoristique-genie-adulte_225453_2.jpg")
genie = Costume.new(name: "Magnificent Genie", description: "Get ready to unleash your inner genie with this sexy and playful costume! The costume features a colorful and shimmering crop top with a matching skirt that flares out at the hips, creating a fun and flirty look. The playful ruffles and gold accents add a touch of Arabian Nights glamour, while the sheer fabric and deep neckline add a hint of sexiness to the overall look. The included waist sash and headpiece complete the ensemble, giving you the perfect finishing touches to make all your wishes come true. Whether you're heading out to a costume party or simply looking to spice things up in the bedroom, this sexy genie costume is the perfect choice. Get ready to grant your own wishes and have a magical time in this enchanting outfit!", price: 30, user: julien)
genie.images.attach(io: file, filename: "genie.jpg", content_type: "image/png")
genie.address = genie.user.address
genie.save!

file = URI.open("https://hips.hearstapps.com/hmg-prod/images/funny-halloween-costumes-flamingo-man-1665693498.jpeg")
flamingo = Costume.new(name: "Flamingo", description: "Get ready to flamingle in this fabulous flamingo costume! The pink feathered bodysuit is sure to turn heads and create a fun and playful atmosphere wherever you go. The costume features a plush and fluffy design that is both comfortable and cozy, making it perfect for a night out or a costume party. The signature flamingo head with its long neck and beak is sure to make you stand out in any crowd, while the attached wings give you the perfect finishing touch to take your costume to the next level. Whether you're looking to add a touch of whimsy to your wardrobe or simply looking for a fun and playful costume, this flamingo costume is sure to make you the life of the party. So spread your wings and let the fun begin!", price: 22, user: julien)
flamingo.images.attach(io: file, filename: "flamingo.jpg", content_type: "image/png")
flamingo.address = flamingo.user.address
flamingo.save!

file = URI.open("https://m.media-amazon.com/images/I/81nZhbA6wPL._UY879_.jpg")
pinata = Costume.new(name: "Pinata", description: "Bring the party and the candy this year with Tipsy Elves’ bright. colorful Pinata Halloween Costume Jumpsuit for Men, just keep an eye out for any sticks coming your way!
  Tipsy Elves’ Halloween costumes are perfect for any spooky occasion. Whether you’re in person, online or out in the world, Tipsy Elves’ halloween costumes have equal parts cozy and amazing. Halloween jumpsuits, costume dresses and costume onesies for kids of all ages! Find a Halloween costume for everyone in the family! With a wide selection of styles and themes from adorable animals, classic movie monsters to daring devils, Tipsy Elves has a costume for everyone in the family!", price: 22, user: julien)
pinata.images.attach(io: file, filename: "pinata.jpg", content_type: "image/png")
pinata.address = pinata.user.address
pinata.save!

puts "seeded #{Costume.count} costumes"


puts "seeding bookings..."

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
puts "seeded #{Booking.count} bookings"


puts "seeding reviews..."
  Booking.all.each do |booking|
    Review.create!(
      rating: (1..5).to_a.sample,
      booking: booking,
      content: "review's content to seed"
    )
  end
puts "seeded #{Review.count} reviews"

puts "seed done"
