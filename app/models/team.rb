class Team < ApplicationRecord

	has_many :games
	has_many :rosters
	has_many :players, through: :rosters
	belongs_to :captain, class_name: :User, foreign_key: :user_id

	validates_presence_of :name, :sport_type, :league_name, :user_id

  def unadded_players
    current_user.players - self.players
  end

  def upcoming_games
     games.where("time > ?", Date.today).order(time: 'ASC')
  end

end
