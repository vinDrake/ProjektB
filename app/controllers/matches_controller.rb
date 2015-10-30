class MatchesController < ApplicationController
  def new
    @match = Match.new
    @players = Player.all
    @questions = Question.all
  end

  def create
  @match = Match.new(match_params)
    if @match.save
      redirect_to @players
    else
      render 'new'
    end
  end

  def index
    @matches = Match.all
  end

  def show
  end

  def edit
  end

  def update
  end

  private
  def match_params
    params.require(:match).permit(:players, :questions)
  end
end
