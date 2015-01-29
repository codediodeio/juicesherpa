class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :soft_user_token
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :recipes, :users
  end
end

# Heroku not adding :soft_user_token... Why?
