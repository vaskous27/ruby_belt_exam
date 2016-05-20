class Event < ActiveRecord::Base
  belongs_to :user

  	has_many :comments, dependent: :destroy
	has_many :joins, dependent: :destroy
	has_many :users_joined, through: :joins, source: :user

	validates :name, :date, :location, :state, presence: true

	validates_date :date, :on_or_after => lambda { Date.current }

end
