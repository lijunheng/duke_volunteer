class Organization < ActiveRecord::Base
	has_many :volunteers, dependent: :destroy
	has_one :location
	acts_as_taggable_on :tags

	def self.search(search)
		if search
			where('name LIKE ?', "%#{search}%")
		else
			scoped
		end
	end

	def distance
		if self.location
			self.location.distance_to("Duke University West Campus, Durham, NC")
		end
	end

	def self.sort(column)
		Organization.all.sort_by!{|o| o.send(column) || 99999999}
	end

	def self.sort_reverse(column)
		Organization.all.sort_by!{|o| o.send(column) || -99999999}.reverse
	end
end
