class AddOrganizationIdToVolunteers < ActiveRecord::Migration
  def change
  	add_column :volunteers, :organization_id, :integer
  	add_index :volunteers, [:organization_id, :created_at]
  end
end
