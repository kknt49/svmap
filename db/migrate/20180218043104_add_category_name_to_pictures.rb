class AddCategoryNameToPictures < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :category_name, :string
  end
end
