class Recipe < ActiveRecord::Base
  has_many     :categories
end
