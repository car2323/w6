class Ingredient < ActiveRecord::Base
	has_many :sandwiches
	has_many :ingredients, through: :sandwiches
end
