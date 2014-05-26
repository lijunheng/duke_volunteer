class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.text :name
      t.text :contact_information

      t.timestamps
    end
  end
end
