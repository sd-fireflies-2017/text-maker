class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :teams
  has_many :games, through: :teams
  has_many :players, through: :teams

  def upcoming_games
  	 games.where("time > ?", Date.today).order(time: 'ASC').limit(5)
  end

end
