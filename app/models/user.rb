class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :comments, through: :events
  has_many :joins, dependent: :destroy
  has_many :events_joined, through: :joins, source: :event

 EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, :password, :location, :state, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
 validates :password, length: {minimum: 8} 

end
