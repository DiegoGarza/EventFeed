class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :events, :lat, :latitude
    rename_column :events, :lng, :longitude
  end
end
