class AddFeaturedImageToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :featured_image, :string
  end
end
