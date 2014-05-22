class Volunteer < ActiveRecord::Base
	validates :name, presence: true
	validates :description, presence: true
	validates :host, presence: true
	validates :date, presence: true
	validates :contact, presence: true
	validates :active, presence: true
end
