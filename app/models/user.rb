require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

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
  validates :username, { presence: true, uniqueness: true }

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    user = self.find_by(username: username)
    if user.password == password
     user
   else
     false
   end
 end
end
