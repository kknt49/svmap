class CreateGpss < ActiveRecord::Migration[5.1]
  def change
    create_table :gpsses do |t|
      t.float :latitude
      t.float :longitude
    end
  end
end
