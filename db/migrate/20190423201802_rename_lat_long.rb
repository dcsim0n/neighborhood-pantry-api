class RenameLatLong < ActiveRecord::Migration[5.2]
  def change
    remove_column :neighborhoods, :lat
    remove_column :neighborhoods, :long
    add_column :neighborhoods, :latitude, :float
    add_column :neighborhoods, :longitude, :float
  end
end
