class AddLocationToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :geo_location, :location
  end
end
