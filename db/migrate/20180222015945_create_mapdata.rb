class CreateMapdata < ActiveRecord::Migration[5.1]
  def change
    create_table :mapdata do |t|
      t.string "cate"
      t.float "lat"
      t.float "lon"
      t.string "cate"
      t.integer "user_id"
      t.timestamps
    end
  end
end
