class AddApplyToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :apply, :text
  end
end
