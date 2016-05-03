class Player < ActiveRecord::Base
	has_many :tournament
	has_many :player, through: :tournament
end
