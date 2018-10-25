# This file should contain all the record creation needed to seed the database with its default values.
require 'faker'
=begin
10.times do
  City.create!(name: Faker::Fallout.location)
end

10.times do
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::RickAndMorty.quote, email: Faker::Internet.email, age: rand(7..77), city_id: rand(City.first.id..City.last.id))
end

10.times do
  Gossip.create!(title: Faker::Fallout.character, content: Faker::Fallout.quote, user_id: rand(User.first.id..User.last.id))
end

10.times do
  Tag.create!(title: Faker::Fallout.faction)
end

10.times do
  Comment.create!(content: Faker::Fallout.quote, user_id: rand(User.first.id..User.last.id), gossip_id: rand(Gossip.first.id..Gossip.last.id))
end

10.times do
  PrivateMessage.create!(content: Faker::RickAndMorty.quote, sender_id: rand(User.first.id..User.last.id), receiver_id: rand(User.first.id..User.last.id))
end
=begin
15.times do
  i = rand(1..2)
  if i == 1
    Like.create!(gossip_id: rand(Gossip.first.id..Gossip.last.id))
  else
    Like.create!(comment_id: rand(Comment.first.id..Comment.last.id))
  end
=end
15.times do
  Tag.all.each do |tag|
    rand(10).times do
      tag.gossips << Gossip.find(rand(Gossip.first.id..Gossip.last.id))
    end
  end
end
