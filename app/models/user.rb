class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 	has_many :teams
 	has_many :games, through: :teams
 	has_many :rosters, through: :teams

 	# validates_presence_of 
 	

end
