class AddDatetimeToVolunteers < ActiveRecord::Migration
  def change
    add_column :volunteers, :datetime, :datetime
  end
end
