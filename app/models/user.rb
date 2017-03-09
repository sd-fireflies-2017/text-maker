class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :teams
  has_many :games, through: :teams
  has_many :players, through: :teams

  # scope :upcoming_games, -> { games.take(5) }
  def upcoming_games
  	 games.all.take(5)
  end

end
