class PlayersController < ApplicationController

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to '/players'
    else
      render 'new'
    end
  end

  def index
    @players = Player.all
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def player_params
    params.require(:player).permit(:name)
  end

end
