class GamesController < ApplicationController

  def index
    @games = current_user.upcoming_games
  end

  def show
    @team = Team.find_by(id: params[:team_id])
    @game = Game.find_by(id: params[:id])
  end

  def new
    @team = Team.find_by(id: params[:team_id])
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.time = time_parse
    @game.team_id = params[:team_id]
    @game.home_team = home?

    if @game.save
      redirect_to team_game_path(@game.team, @game)
    else
      @team = Team.find_by(id: params[:team_id])
      render :new
    end
  end

  def notify
    Rake::Task['players:message'].invoke
    @game = Game.find_by(id: params[:game_id])
    redirect_to @game
  end


  private

  def game_params
    params.require(:game).permit(:location, :opposing_team, :team_id, :players_required)
  end

  def time_parse
    game = params[:game]
    DateTime.new(game['time(1i)'].to_i,game['time(2i)'].to_i,game['time(3i)'].to_i,game['time(4i)'].to_i,game['time(5i)'].to_i,game['time(6i)'].to_i)
  end

  def home?
    params[:game][:home_team] == 0 ? false : true
  end

end
