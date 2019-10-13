class Category < ActiveRecord::Base
  validates    :colour, length: { in: 3..20 }, uniqueness: true
  
  has_many   :categories_recipes
  has_many   :recipes, through: :categories_recipes

  before_save { colour.downcase! }
end
