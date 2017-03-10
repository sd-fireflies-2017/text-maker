class RostersController < ApplicationController

  def create
    @team = Team.find_by(id: params[:team_id])
    @roster = Roster.new(team_id: params[:team_id], player_id: params[:roster][:player_id], core: core?)
    if @roster.save
      redirect_to @team, notice: 'Player was successfully added.'
    else
      redirect_to new_team_player_path(@team)
    end
  end

  def destroy
    @team = Team.find_by(id: params[:team_id])
    @roster = Roster.find_by(team_id: 'team', player_id: 'player')
    @roster.destroy
    redirect_to @team
  end


  private

  def core?
    params[:roster][:core] == 1 ? 'true' : 'false'
  end

end
