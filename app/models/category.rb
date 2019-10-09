class Category < ActiveRecord::Base
  has_many   :recipes_categorie
  has_many   :recipes, through: :categories_recipes
end
