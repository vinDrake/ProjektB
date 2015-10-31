class DuelsController < ApplicationController
  def new
    @player_select = Player.all
    @duel = Duel.new
  end

  def create
    @duel = Duel.new(duel_params)
    if @duel.save
      redirect_to duels_path#player_path(session[:player_id])
    else
      render 'new'
    end
  end

  def index
    @duels = Duel.all
  end

  def show
    @duel = Duel.find(params[:id])
  end

  private
  def duel_params
    dp = params.require(:duel).permit(:player_two_id)
    dp[:player_one] = Player.find(session[:player_id])
    return dp
  end
end
