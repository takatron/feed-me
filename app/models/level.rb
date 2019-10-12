class Level < ActiveRecord::Base
  validates    :name, presence: true, length: { in: 3..20 }, uniqueness: true
  
  has_many     :recipes
end
