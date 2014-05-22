class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.string :name
      t.string :description
      t.string :host
      t.string :date
      t.string :contact
      t.boolean :active

      t.timestamps
    end
  end
end
