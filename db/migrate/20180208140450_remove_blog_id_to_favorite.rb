class RemoveBlogIdToFavorite < ActiveRecord::Migration[5.1]
  def change
    remove_column :favorites, :blog_id, :string
  end
end
