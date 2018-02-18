class RemoveCategoryNameFromPictures < ActiveRecord::Migration[5.1]
  def change
    remove_column :pictures, :category_name, :string
  end
end
