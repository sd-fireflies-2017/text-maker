class PlayersController < ApplicationController

  def new
    @team = Team.find_by(id: params[:team_id])
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      Roster.create(team_id: params[:player][:team_ids], player: @player)
      redirect_to @player, notice: 'Player was successfully created.'
    else
      render :new, errors: @player.errors.full_messages.join(", ")
    end
  end

  def show
    @player = Player.find_by(id: params[:id])
  end

  def decline
    @game = Game.find_by(id: params[:game_id])
    @confirmation = Confirmation.find_or_initialize_by(player_id: params[:player_id], game_id: params[:game_id])
    @confirmation.confirmed = false
    @confirmation.save!

    redirect_to team_game_path(@game.team, @game)
  end

  def confirm
    @game = Game.find_by(id: params[:game_id])
    @confirmation = Confirmation.find_or_initialize_by(player_id: params[:player_id], game_id: params[:game_id])
    @confirmation.confirmed = true
    @confirmation.save

    redirect_to team_game_path(@game.team, @game)
  end

  private

  def player_params
    params.require(:player).permit(:name, :phone_number)
  end

end
