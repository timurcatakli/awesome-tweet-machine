# lindsey = User.create(name: 'Lindsey')

# tweet = Tweet.create(post: "Hello World")

# timur = User.create(name: 'Timur')

require 'faker'
require_relative '../app/models/user'
require_relative '../app/models/tweet'

13.times do
  name = Faker::Name.name
  user = User.create( name: name,
                username: Faker::Internet.user_name(name),
                email: Faker::Internet.safe_email(name)
                )
  tweet = Tweet.create(post: Faker::Lorem.sentence(4))
  user.tweets << tweet
  user.save
  tweet.save
end

13.times do
  Tweet.create(post: Faker::Lorem.sentence(4))
end

13.times do
  tweet = Tweet.find(rand(1..13))
  user = User.find(rand(1..13))
  user.tweets << tweet
  user.save
  tweet.save
end

26.times do
  user1 = User.find(rand(1..13))
  user2 = User.find(rand(1..13))

  user1.followers << user2

  user1.save
  user2.save
end

