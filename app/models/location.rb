class Location < ActiveRecord::Base
	belongs_to :organization
	validates :address, presence: true
	validates :latitude, presence: true
	validates :longitude, presence: true
	geocoded_by :address
	before_validation :geocode
end
