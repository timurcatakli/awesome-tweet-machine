class User < ActiveRecord::Base
  has_many :tweets
  has_many :retweets

  has_many :active_connections, class_name: "Connection",
                                foreign_key: "follower_id",
                                dependent: :destroy
  has_many :passive_connections, class_name: "Connection",
                                 foreign_key: "followed_id",
                                 dependent: :destroy
  has_many :following, through: :active_connections, source: :followed
  has_many :followers, through: :passive_connections, source: :follower
  # Remember to create a migration!

  validates :email, { presence: true, uniqueness: true }
end
