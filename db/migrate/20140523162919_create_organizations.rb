class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.text :name
      t.text :contact_information
      t.integer :location_id
      t.timestamps
    end
  end
end
