class User < ActiveRecord::Base
  has_many :events
  has_many :friends
  attr_accessible :email, :password, :password_confirmation
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_uniqueness_of :email


  def send_friend_request(friend)
    ## You can override it, but moto is to send a request to another friend
    ## and update the friends table
    self.friends << Friend.create(:friend_id => friend.id,:status => "pending") if friend.persisted?
  end

  def accepting_friend_request(friend)
    ## check whether the friend request is in pending state for a particular fiend
    requested_friend =  Friend.where(:friend_id => self.id,:user_id => friend.id)
    if requested_friend.any? && requested_friend.last.status == "pending"
      ## Do necessary checking
      requested_friend.last.status = "true"
      self.friends << Friend.create(:friend_id => friend.id)
    end

  end

end
