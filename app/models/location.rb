class Location < ActiveRecord::Base
	belongs_to :organization
	geocoded_by :address
	after_validation :geocode
end
