class Dropcontact < ActiveRecord::Migration[5.1]
  def change
    drop_table :inquiries
  end
end
