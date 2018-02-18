class RemoveCategoryIdFromPictures < ActiveRecord::Migration[5.1]
  def change
    remove_column :pictures, :category_id, :integer
  end
end
