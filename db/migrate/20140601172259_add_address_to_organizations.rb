class AddAddressToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :address, :text
  end
end
