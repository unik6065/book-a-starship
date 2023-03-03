require 'faker'
require 'open-uri'

puts 'cleaning database'
Review.destroy_all
Rental.destroy_all
Starship.destroy_all
User.destroy_all

puts 'creating users'
5.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: '123456',
    email: Faker::Internet.email
  )
  puts 'created user'
end

files = Dir.children("db/images").map do |file_name|
  File.open("#{Rails.root}/db/images/#{file_name}")
end

puts 'creating starships'

starship1 = Starship.new(name: "Faucon Millenium",
  description: "Avec ses 34 mètres de longueur, 20 mètres d'envergure et sa capacité de 100 tonnes de fret, il est apprécié des transporteurs de toute la galaxie. Pour un déménagement ou pour transporter grosse cargaison, ce vaisseau est fait pour vous !",
  pickup_city: Faker::Nation.capital_city,
  loaner_id: User.all.sample.id,
  price_per_day: rand(100..500)
)
starship1.photos.attach(io: files[6], filename: File.basename(files[6]), content_type: 'image/png')
starship1.save!
puts "#{starship1.name} created"

starship2 = Starship.new(name: "USS Enterprise",
  description: "Parfait pour partir sur des longues périodes. Equipements derniers cri, espace SPA et relaxation. L'équipage de l'USS Enterprise sera vous faire passer des moments inoubliables!",
  pickup_city: Faker::Nation.capital_city,
  loaner_id: User.all.sample.id,
  price_per_day: rand(100..500)
)
starship2.photos.attach(io: files[4], filename: File.basename(files[4]), content_type: 'image/png')
starship2.save!
puts "#{starship2.name} created"

starship3 = Starship.new(name: "Artemis II",
  description: "Parfait pour partir sur des longues périodes. Equipements derniers cri, espace SPA et relaxation. L'équipage de l'USS Enterprise sera vous faire passer des moments inoubliables!",
  pickup_city: Faker::Nation.capital_city,
  loaner_id: User.all.sample.id,
  price_per_day: rand(100..500)
)
starship3.photos.attach(io: files[2], filename: File.basename(files[2]), content_type: 'image/png')
starship3.save!
puts "#{starship3.name} created"

starship4 = Starship.new(name: "Death Star",
  description: "Vous trouverez tout ce que vous souhaitez (cinéma, restaurant, piscine,...) dans cette station de la taille d'une petite lune. Parfait pour graviter autour d'une planète. Une navette est disponible pour vos petits déplacements.",
  pickup_city: Faker::Nation.capital_city,
  loaner_id: User.all.sample.id,
  price_per_day: rand(100..500)
)
starship4.photos.attach(io: files[0], filename: File.basename(files[0]), content_type: 'image/png')
starship4.save!
puts "#{starship4.name} created"

starship5 =Starship.new(name: "The Milano",
  description: "Ce vaisseau M-Class est parfait pour un groupe d'amis. Vous pourrez profiter de son salon disco pour organiser des soirées endiablées.",
  pickup_city: Faker::Nation.capital_city,
  loaner_id: User.all.sample.id,
  price_per_day: rand(100..500)
)
starship5.photos.attach(io: files[1], filename: File.basename(files[1]), content_type: 'image/png')
starship5.save!
puts "#{starship5.name} created"

starship6 =Starship.new(name: "Pegasus",
  description: "Faites une balade matinale en profitant de la galaxie Centaure grâce à notre vaisseau dernier cri et rapide. Machine à café disponible dans la cabine de pilotage.",
  pickup_city: Faker::Nation.capital_city,
  loaner_id: User.all.sample.id,
  price_per_day: rand(100..500)
)
starship6.photos.attach(io: files[5], filename: File.basename(files[5]), content_type: 'image/png')
starship6.save!
puts "#{starship6.name} created"

starship7 =Starship.new(name: "Spectator X12-J",
  description: "Détendez-vous dans ce maginifique vaisseau en bord de planète. Profitez de la vue grâce à nos vitres anti-rayons gamma et triple-couche.",
  pickup_city: Faker::Nation.capital_city,
  loaner_id: User.all.sample.id,
  price_per_day: rand(100..500)
)
starship7.photos.attach(io: files[7], filename: File.basename(files[7]), content_type: 'image/png')
starship7.save!
puts "#{starship7.name} created"

starship8 =Starship.new(name: "Star Destroyer",
  description: "Vaisseau pour transporter toute la famille. Lent et stable, vous oublierez complétement que vous êtes dans un vaisseau!.",
  pickup_city: Faker::Nation.capital_city,
  loaner_id: User.all.sample.id,
  price_per_day: rand(100..500)
)
starship8.photos.attach(io: files[3], filename: File.basename(files[3]), content_type: 'image/png')
starship8.save!
puts "#{starship8.name} created"

starship9 =Starship.new(name: "Portia Eagle",
  description: "Parfait pour un couple à la recherche d'un nid douillet. Cosy et chaleureux, vous ne voudrez plus le quitter!",
  pickup_city: Faker::Nation.capital_city,
  loaner_id: User.all.sample.id,
  price_per_day: rand(100..500)
)
starship9.photos.attach(io: files[8], filename: File.basename(files[8]), content_type: 'image/png')
starship9.save!
puts "#{starship9.name} created"

starship10 = Starship.new(name: "Sigma Jupiter",
  description: "Equipé d'une serre verdoyante, vous aurez l'impression d'être en pleine forêt ! Parfait pour quitter la pollution et le bruit de la ville.",
  pickup_city: Faker::Nation.capital_city,
  loaner_id: User.all.sample.id,
  price_per_day: rand(100..500)
)
starship10.photos.attach(io: files[9], filename: File.basename(files[9]), content_type: 'image/png')
starship10.save!
puts "#{starship10.name} created"

# 10.times do |i|
#   starship = Starship.new(
#     name: Faker::Fantasy::Tolkien.character,
#     description: Faker::Books::Lovecraft.sentence,
#     pickup_city: Faker::Nation.capital_city,
#     loaner_id: User.all.sample.id,
#     price_per_day: rand(100..500)
#   )
#   starship.photos.attach(io: files[i], filename: File.basename(files[i]), content_type: 'image/png')
#   starship.save!
#   puts 'created starship'
# end

puts 'creating rentals'
10.times do
  Rental.create!(
    start_date: Faker::Date.backward(days: 14),
    end_date: Faker::Date.forward(days: 23),
    starship_id: Starship.all.sample.id,
    renter_id: User.all.sample.id,
    price: rand(1000..5000),
    status: Rental.statuses.keys.sample
  )
  puts 'created rental'
end
puts 'creating reviews'

content = ["Super vaisseau bien équipé ! Très agréable à piloter", "Je suis conquise par ce vaisseau! Rapide et stable, je recommande!",
  "J'ai adoré mon séjour dans ce vaisseau! Cuisine au top", "J'ai passé un moment parfait avec ma famille !", "Je n'ai pas aimé la décoration dans le vaisseau. Manque de goût",
  "Vaisseau vieillissant et qui secoue beaucoup. A réparer au plus vite svp !", "Le personnel est super sympa et le vaisseau propre. Je recommande !",
  "Séjour icroyable ! Rien à redire", "La chambre du vaisseau n'était pas très propre mais sinon ça allait. Manque d'un aspirateur"]

Rental.all.each do |rental|
  next unless rental.accepted?
  Review.create!(
    content: content.sample,
    rating: rand(3..5),
    rental:
  )
  puts 'created review'
end

puts 'seed finished'
