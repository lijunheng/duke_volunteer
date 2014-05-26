class AddWebsiteToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :website, :text
  end
end
