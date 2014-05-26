class Organization < ActiveRecord::Base
	has_many :volunteers, dependent: :destroy
	validates :location, presence: true
end
