class AddItemIdToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :item_id, :string
  end
end
