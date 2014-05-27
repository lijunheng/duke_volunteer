class Organization < ActiveRecord::Base
	has_many :volunteers, dependent: :destroy
	has_one :location

	def self.search(search)
		if search
			find(:all, :conditions => ['lower(name) LIKE ?', "%#{search}%".downcase]) 
		else
			find(:all)
		end
	end

	def distance
		self.location.distance_to("Duke University West Campus, Durham, NC")
	end

	def self.sort_by_distance
		Organization.all.sort_by!(&:distance)
	end

	def self.sort_by_distance_reverse
		Organization.all.sort_by!(&:distance).reverse
	end
end
