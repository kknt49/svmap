class AddCateToPictures < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :cate, :string
  end
end
