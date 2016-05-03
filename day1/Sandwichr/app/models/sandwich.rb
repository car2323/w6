class Sandwich < ActiveRecord::Base
	has_many :ingredients
	has_many :sandwiches, through: :ingredients
end
