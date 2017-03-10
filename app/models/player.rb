class Player < ApplicationRecord

	has_many :rosters
	has_many :teams, through: :rosters
	has_many :games, through: :teams
  



	validates_presence_of :name, :phone_number
  validate :check_phone_number

  def check_phone_number
    self.phone_number.gsub!(/\D/, "")
    if phone_number.length != 10
      errors.add(:phone_number, "is not a valid number.")
    end
  end

  def core

  end

  def core=(item)

  end
end
