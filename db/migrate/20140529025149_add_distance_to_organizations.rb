class AddDistanceToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :distance, :float
  end
end
