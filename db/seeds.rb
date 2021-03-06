# lindsey = User.create(name: 'Lindsey')

# tweet = Tweet.create(post: "Hello World")

# timur = User.create(name: 'Timur')

require 'faker'
require_relative '../app/models/user'
require_relative '../app/models/tweet'

20.times do
  name = Faker::Name.name
  user = User.create( name: name,
                username: Faker::Internet.user_name(name),
                email: Faker::Internet.safe_email(name)
                )
  rand(10).times do
    tweet = Tweet.create(post: Faker::Lorem.sentence(4))
    user.tweets << tweet
    tweet.save
  end
  user.password = "test"
  user.save
end

10.times do
  random_user = User.all.sample(1)[0].id

  original_tweet = Tweet.all.sample(1)[0]
  p "Tweet: "
  p original_tweet
  Retweet.create!(tweet_id: original_tweet.id, user_id: random_user) if original_tweet.user_id != random_user
end

26.times do
  user1 = User.all.sample(1)[0]
  user2 = User.all.sample(1)[0]

  if user1.id != user2.id
    user1.followers << user2 unless user1.followers.include? user2
  end

  user1.save
  user2.save
end


