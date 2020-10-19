# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

don = User.create(username:"donna", password: "josie")
mj = User.create(username:"mary", password:"jo")

Listing.create(item:"dog toy", description:"for a good dog", price: 15, condition: "new", status: "available", zipcode: 77089, contact: "email me at ilydogs@yahoo.com", seller: don)
Listing.create(item:"bike", description:"red, tires new", price: 100, condition: "used - good", status: "pending", zipcode: 77586, contact: "call 777-777-7777", seller: don)
Listing.create(item:"chair", description:"wicker, with cushion", price: 20, condition: "used - like new", status: "sold", zipcode: 77581, contact: "call 777-777-7777", seller: don, buyer: mj)

toy = Listing.find_by(id: 1)
chair = Listing.find_by(id: 3)

chairpic1 = Photo.create(url:"https://www.ikea.com/us/en/images/products/stefan-chair-brown-black__0727320_PE735593_S5.JPG?f=s", listing: chair)
chairpic2 = Photo.create(url:"https://www.ikea.com/us/en/images/products/stefan-chair-brown-black__0870436_PE672126_S5.JPG?f=s", listing: chair)
dogtoypic = Photo.create(url: "https://images-na.ssl-images-amazon.com/images/I/61UZk4gnL9L._AC_SL1500_.jpg", listing: toy)

Request.create(name: "your buddy, mary", phone:"2818987687", message: "i'll take it!", buyer: mj, listing: toy)