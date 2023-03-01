require 'faker'
require 'open-uri'
# puts 'cleaning database'
# Review.destroy_all
# Rental.destroy_all
# Starship.destroy_all
# User.destroy_all

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

puts 'creating starships'
10.times do
  file = URI.open("http://poopss.p.o.pic.centerblog.net/o/e04b1581.jpg")
  starship = Starship.new(
    name: Faker::Fantasy::Tolkien.character,
    description: Faker::Books::Lovecraft.sentence,
    pickup_city: Faker::Nation.capital_city,
    loaner_id: User.all.sample.id,
    price_per_day: rand(100..500)
  )
  starship.photos.attach(io: file, filename: 'starship.png', content_type: 'image/png')
  starship.save!
  puts 'created starship'
end

puts 'creating rentals'
10.times do
  Rental.create!(
    start_date: Faker::Date.backward(days: 14),
    end_date: Faker::Date.forward(days: 23),
    starship_id: Starship.all.sample.id,
    renter_id: User.all.sample.id,
    price: rand(1000..5000)
  )
  puts 'created rental'
end

puts 'creating reviews'
10.times do
  Review.create!(
    content: Faker::TvShows::BigBangTheory.quote,
    rating: rand(3..5),
    rental_id: Rental.all.sample.id
  )
  puts 'created review'
end

puts 'seed finished'
