class Roster < ApplicationRecord

	belongs_to :player
	belongs_to	:team

	validates_presence_of :player, :team, :player_id, :team_id
	
end