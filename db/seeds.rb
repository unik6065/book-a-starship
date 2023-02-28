require 'faker'

puts 'cleaning database'
User.delete_all

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

puts 'seed finished'
