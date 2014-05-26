class Volunteer < ActiveRecord::Base
	belongs_to :organization
	default_scope -> { order('created_at DESC') }

	validates :name, presence: true
	validates :description, presence: true
	validates :datetime, presence: true
end
