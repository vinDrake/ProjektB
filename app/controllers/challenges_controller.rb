class ChallengesController < ApplicationController
  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    if @challenge.question_array.empty? do
      @challenge.question_array = [1]
    end
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
    @challenge = Challenge.find("params[:id]")

    if @challenge.question_array.empty? do
      @question_array = [1]
    else
      @question_array = @challenge.question_array.split(',').collect! {|n| n.to_i}

    end

  end

  private
  def challenge_params
     cp = params.require(:challenge).permit(:name, :alive, :question_array)
     cp[:alive] = "t"
     return cp
  end

end
