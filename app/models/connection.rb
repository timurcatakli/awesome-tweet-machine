class Connection < ActiveRecord::Base
  belongs_to :follower,  class_name: 'User'
  belongs_to :followed, class_name: 'User'  #class name users foreign key conneciton ID

  # Remember to create a migration!
end
