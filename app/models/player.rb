class Player < ApplicationRecord

	has_many :rosters
	has_many :teams, through: :rosters
	has_many :games, through: :teams


	validates_presence_of :name, :phone_number

end