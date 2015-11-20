class CreateUserlocations < ActiveRecord::Migration
  def change
    create_table :userlocations do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :location_type
      t.string :location_name
      t.timestamps null: false
    end
  end
end
