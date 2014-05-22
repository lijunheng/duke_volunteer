class ChangeDescriptionFormatInMyTable < ActiveRecord::Migration
  def change
  	change_column :volunteers, :description, :text
  end
end
