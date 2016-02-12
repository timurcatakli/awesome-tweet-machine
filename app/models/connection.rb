class Connection < ActiveRecord::Base
  belongs_to :follower,  class_name: 'User'
  belongs_to :followed, class_name: 'User'

  # User can only follow another user once
  validates :followed_id, uniqueness: { scope: :follower_id }

  # Remember to create a migration!
end
