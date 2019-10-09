class Recipe < ActiveRecord::Base
  has_many   :categories_recipes
  has_many   :categories, through: :categories_recipes
  has_one :level
end
