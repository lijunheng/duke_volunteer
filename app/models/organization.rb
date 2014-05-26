class Organization < ActiveRecord::Base
	has_many :volunteers, dependent: :destroy
	validates :location, presence: true

	def self.search(search)
		if search
			find(:all, :conditions => ['lower(name) LIKE ?', "%#{search}%".downcase]) 
		else
			find(:all)
		end
	end
end