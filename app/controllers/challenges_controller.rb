class ChallengesController < ApplicationController
  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    if @challenge.save
      redirect_to challenges_path
    else
      render 'new'
    end
  end

  def index
    @challenges = Challenge.all
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  private
  def challenge_params
     params.require(:challenge).permit(:name)

  end
end
