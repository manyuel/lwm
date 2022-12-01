# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'
require 'faker'

Transaction.destroy_all
Product.destroy_all
User.destroy_all

puts "Creating users..."

user_hash = {
  'Ammar Amin': 'https://avatars.githubusercontent.com/u/115180008?v=4',
  'Ali-Hamza Asam': 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1665128960/syiabnh0kvrxxo7wtv5p.jpg',
  'Aleksander Avila': 'https://avatars.githubusercontent.com/u/92654253?v=4',
  'Gabriel Bijlmakers': 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1665352733/ujlzzki3lltkroe6iwyp.jpg',
  'Andrew Birch': 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1665324908/zjwdjy7ufjwaym65xrju.jpg',
  'Malik Bouaoudia': 'https://avatars.githubusercontent.com/u/93919227?v=4',
  'Lucas Brown': 'https://avatars.githubusercontent.com/u/109978500?v=4',
  'Yasmin Brown': 'https://avatars.githubusercontent.com/u/115090869?v=4',
  'Tomas Bui Lai': 'https://avatars.githubusercontent.com/u/62653049?v=4',
  'Constança Casimiro': 'https://avatars.githubusercontent.com/u/110919556?v=4',
  'Christian Cooney': 'https://avatars.githubusercontent.com/u/114586151?v=4',
  'Louis Cox': 'https://avatars.githubusercontent.com/u/112500887?v=4',
  'Jon Entwistle': 'https://avatars.githubusercontent.com/u/115186694?v=4',
  'Harry Fleminger': 'https://avatars.githubusercontent.com/u/42039545?v=4',
  'Francisco Goicoechea': 'https://avatars.githubusercontent.com/u/115219562?v=4',
  'Megan Gordon': 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1665470099/re4cmagxjoihkyccwt47.jpg',
  'George Hill': 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1666000400/ckza56x1ejxcjiq7aioy.jpg',
  'Pia Holtappels': 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1665432668/ktggpue9rpss8thcf3ti.jpg',
  'Charleen Ipping': 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1665137023/vtecalo31mcg7b2sek6s.jpg',
  'Ben Kaefer': 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1665561644/ijdk8u1th6hbjjryyobs.jpg',
  'Do Yeon Kim': 'https://avatars.githubusercontent.com/u/47461503?v=4',
  'Emilio Marcos': 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1665271960/udmkjiu6mlzwa6xc9r0l.jpg',
  'Juan Mendoza': 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1666771070/qlnjgehqbwa3kgj5zrr5.jpg',
  'Kamal Minott': 'https://avatars.githubusercontent.com/u/115084160?v=4',
  'Daniel Pearson': 'https://avatars.githubusercontent.com/u/67384750?v=4',
  'Percy Pendragon': 'https://avatars.githubusercontent.com/u/112077354?v=4',
  'Lydia Ratto': 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1665222675/cyzz7selaluqbkmrhxwy.jpg',
  'John Romero': 'https://avatars.githubusercontent.com/u/113219493?v=4',
  'Chirantan Sahasrabudhe': 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1650046228/z2lueo6z7rtrlfcjtf6m.jpg',
  'Manuel Sánchez': 'https://avatars.githubusercontent.com/u/110119371?v=4',
  'Maaz Sattar': 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1665138353/bhthwua49n4cmj9wf7fk.jpg',
  'Oona Singh': 'https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1665316254/ezsukgcdiujj57nbagpw.jpg',
  'Daniela Socaciu': 'https://avatars.githubusercontent.com/u/110628821?v=4',
  'Ilias Wardere': 'https://avatars.githubusercontent.com/u/115351615?v=4',
  'Mateo Westphal': 'https://avatars.githubusercontent.com/u/115327575?v=4',
  'Safiyah Zaman': 'https://avatars.githubusercontent.com/u/115396666?v=4'
}

products = ['Elephant Bike', 'Mug', 'Frying Pan', 'Record Player']
conditions = ['excellent', 'good', 'okay', 'bad']

i = 0

20.times do
  user = User.create!(
    name: user_hash.keys.sample,
    email: "user@email.com",
    city: "London",
    batch: 1051,
    password: '123456',
    rating: rand(1..5)
  )

  # photo: user_hash[user.name] (where do I insert this???)

  puts "User Created"

  puts "Creating Product..."

  product = Product.new(
    item: products[i],
    price: rand(1.99..49.99),
    description: "#{products[i]} in #{conditions.sample} condition. No longer needed as I'm moving back home",
    user_id: user.id
  )

  user_file = URI.open('https://thispersondoesnotexist.com/image')
  user.photo.attach(io: user_file, filename: "#{user.name}.jpg", content_type: 'image/jpg')
  product_file1 = open("app/assets/images/#{products[i]}1.jpg")
  product.photos.attach(io: product_file1, filename: "#{products[i].strip.gsub(/\s+/, "_")}1.jpg", content_type: 'image/jpg')
  product_file2 = open("app/assets/images/#{products[i]}2.jpg")
  product.photos.attach(io: product_file2, filename: "#{products[i].strip.gsub(/\s+/, "_")}2.jpg", content_type: 'image/jpg')
  product_file3 = open("app/assets/images/#{products[i]}3.jpg")
  product.photos.attach(io: product_file3, filename: "#{products[i].strip.gsub(/\s+/, "_")}3.jpg", content_type: 'image/jpg')

  product.save!
  i += 1

  puts "Product Created"
end

puts "Done!"
