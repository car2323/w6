class Tournament < ActiveRecord::Base
	has_many :player
	has_many :tournament, through: :player
end
