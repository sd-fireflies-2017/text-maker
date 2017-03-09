class Confirmation < ApplicationRecord

	belongs_to :player
	belongs_to :game

	validates_presence_of :game, :player, :game_id, :player_id
end
