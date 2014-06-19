class User < ActiveRecord::Base
  has_many :events
  attr_accessible :email, :password, :password_confirmation
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_uniqueness_of :email
end
