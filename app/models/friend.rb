class Friend < ActiveRecord::Base
  attr_accessible :friend_id, :user_id,:status
  belongs_to :user
end
