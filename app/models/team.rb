class Team < ApplicationRecord

	belongs_to :captain, class_name: :User
	has_many :games
	has_many :rosters
	has_many :players, through: :rosters

	validates_presence_of :name, :sport_type, :league_name, :user_id

end
