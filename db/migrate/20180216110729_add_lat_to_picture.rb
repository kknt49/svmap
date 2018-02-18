class AddLatToPicture < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :lat, :float
    add_column :pictures, :lon, :float
  end
end
