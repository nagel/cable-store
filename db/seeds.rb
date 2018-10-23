# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# rails generate model cable name:string price:integer length:string function:string model_year:integer image_url:string description:string

vendor = Vendor.new({name: "Amazon", email: "amazon@amazon.com", phone: 1231231233})
vendor.save

vendor = Vendor.new({name: "Newegg", email: "newegg@newegg.com", phone: 1231567233})
vendor.save

cable = Cable.new({vendor_id: 1, name: "VGA", price: 7.00, length: "6ft", function: "Video", model_year: 2007, description: "An old cable that only old laptops use. Doesn't support audio even though you'd think it would."})
cable.save

cable = Cable.new({vendor_id: 1, name: "HDMI", price: 15.00, length: "10ft", function: "Video and audio", model_year: 2017, description: "Best all around cable as it works with every non-mobile device."})
cable.save

cable = Cable.new({vendor_id: 2, name: "DisplayPort", price: 30.00, length: "5ft", function: "Video and audio", model_year: 2012, description: "Just like HDMI, but for whatever reason only used in professional settings."})
cable.save


