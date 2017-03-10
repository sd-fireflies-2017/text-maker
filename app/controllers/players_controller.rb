class PlayersController < ApplicationController

  def new
    @team = Team.find_by(id: params[:team_id])
    @player = Player.new
  end

  def create
    p params
    p core?

    @player = Player.new(player_params)

    params[:team_id] ? @team = Team.find_by(id: params[:team_id]) : @team = Team.find_by(id: params[:player][:team_ids])

    if @player.save
      Roster.create(team: @team, player: @player, core: core?)
      redirect_to @team, notice: 'Player was successfully created.'
    else
      render :new, errors: @player.errors.full_messages.join(", ")
    end
  end

  def show
    @player = Player.find_by(id: params[:id])
  end

  def edit
    @player = Player.find_by(id: params[:id])
    @team = Team.find_by(id: params[:team_id])
  end

  def update
    @team = Team.find_by(id: params[:team_id])
    @player = Player.find_by(id: params[:id])
    if @player.update(player_params)
      p params
      @roster = Roster.find_or_initialize_by(team: @team, player: @player)
      @roster.core = core?
      @roster.save
      redirect_to @team
    else
      render :edit
    end
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
    if @game.full?
      redirect_to team_game_path(@game.team, @game), notice: "Game is already full."
    else
      @confirmation = Confirmation.find_or_initialize_by(player_id: params[:player_id], game_id: params[:game_id])
      @confirmation.confirmed = true
      @confirmation.save

      redirect_to team_game_path(@game.team, @game)
    end
  end

  def remove
    @team = Team.find_by(id: params[:team_id])
    @roster = Roster.find_by(team_id: params[:team_id], player_id: params[:id])
    @roster.destroy
    redirect_to @team
  end

  def core
    @player = Player.find_by(id: params[:player_id])
    @team = Team.find_by(id: params[:team_id])
    @roster = Roster.find_by(team: @team, player: @player)
    @roster.core = !@roster.core
    @roster.save

    redirect_to @team
  end

  private

  def player_params
    params.require(:player).permit(:name, :phone_number)
  end

  def core?
    params[:player][:core] == '1' ? 'true' : 'false'
  end

end
