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
    @player = Player.find(params[:id])
    @questions = Question.all
    if @questions.any?
      size = @questions.size
      @question = Question.find((1 + rand(size)).to_i)
    end
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
