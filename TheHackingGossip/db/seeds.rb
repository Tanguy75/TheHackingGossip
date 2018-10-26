# This file should contain all the record creation needed to seed the database with its default values.
require 'faker'

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
  Comment.create!(content: Faker::Fallout.quote, user_id: rand(User.first.id..User.last.id), commenteable_id: rand(Gossip.first.id..Gossip.last.id), commenteable_type: "Gossip")
  Comment.create!(content: Faker::Fallout.quote, user_id: rand(User.first.id..User.last.id), commenteable_id: rand(Comment.first.id..Comment.last.id), commenteable_type: "Comment")
end

10.times do
  PrivateMessage.create!(content: Faker::RickAndMorty.quote, sender_id: rand(User.first.id..User.last.id))
end

40.times do
  Multirecipient.create(private_message_id: rand(PrivateMessage.first.id..PrivateMessage.last.id), user_id: rand(User.first.id..User.last.id))
end

15.times do
  Like.create!(likeable_id: rand(Gossip.first.id..Gossip.last.id), likeable_type: "Gossip", user_id: rand(User.first.id..User.last.id))
  Like.create!(likeable_id: rand(Comment.first.id..Comment.last.id), likeable_type: "Comment", user_id: rand(User.first.id..User.last.id))
end

15.times do
  Tag.all.each do |tag|
    rand(10).times do
      tag.gossips << Gossip.find(rand(Gossip.first.id..Gossip.last.id))
    end
  end
end
