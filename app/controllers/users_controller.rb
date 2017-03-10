class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to user_path(current_user)
  end

  def show
    @user = User.find(params[:id])
    @games = current_user.upcoming_games
    unless @user == current_user
      redirect_to root_path, :alert => "Access denied."
    end
  end

end
