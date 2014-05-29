namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		30.times do |n|
			name = Faker::Name.name
			contact_information = Faker::PhoneNumber.phone_number
			website = "website"
			description = "description"
			address = Faker::Address.street_address + ", " + Faker::Address.city + ", " + Faker::Address.state_abbr
			geo_location = Location.new(address: address)
			geo_location.save!
			distance = geo_location.distance_to("Duke University West Campus, Durham, NC")
			Organization.create!(name: name,
				contact_information: contact_information,
				website: website,
				description: description,
				location: geo_location,
				distance: distance)
		end
	end
end