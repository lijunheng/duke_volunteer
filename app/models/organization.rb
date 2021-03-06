class Organization < ActiveRecord::Base
	has_many :volunteers, dependent: :destroy
	has_one :location
	acts_as_taggable_on :tags
	validates :name, presence: true

	def self.search(search)
		if search
			where('name LIKE ?', "%#{search}%")
		else
			scoped
		end
	end

	def self.sort(column)
		Organization.all.sort_by!{|o| o.send(column) || 99999999}
	end

	def self.sort_reverse(column)
		Organization.all.sort_by!{|o| o.send(column) || -99999999}.reverse
	end

	def self.to_csv(options = {})
	  CSV.generate(options) do |csv|
	    csv << column_names
	    all.each do |organization|
	      csv << organization.attributes.values_at(*column_names)
	    end
	  end
	end
end
