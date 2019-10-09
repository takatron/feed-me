class CreateCategoriesRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :categories_recipes do |t|
      t.integer :recipe_id
      t.integer :category_id
    end
  end
end
