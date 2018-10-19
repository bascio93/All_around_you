class AddLatitudeLongitudeToServizi < ActiveRecord::Migration[5.1]
  def change
    add_column :servizis, :latitude, :float
    add_column :servizis, :longitude, :float
  end
end
