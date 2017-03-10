class Game < ApplicationRecord
  belongs_to :team
  has_many :players, through: :team
  has_one :captain, through: :team
  has_many :confirmations
  has_many :responded_players, through: :confirmations

  validates :location, :time, :opposing_team, :team_id, :players_required, presence: true
  validate :check_full_team

  def check_full_team
    if players_required.to_i <= 0
      errors.add(:players_required, "cannot be less than one.")
    end
  end


  def name
    "#{team.name} vs #{opposing_team}"
  end

  def confirmed_players
    confirms = self.confirmations.where(confirmed: true)
    if confirms.any?
      confirms.map(&:player).flatten
    else
      []
    end
  end

  def declined_players
    declines = self.confirmations.where(confirmed: false)
    if declines.any?
      declines.map(&:player).flatten
    else
      []
    end
  end

  def players_without_confirmations
    all_players = self.players
    all_players -= confirmed_players
    all_players -= declined_players
    all_players
  end

  def full?
    confirmed_players.count >= players_required
  end

  def clean_time
    time.strftime("%l:%M%P %A, %b %e")
  end


end
