class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
#    @player = Player.find(params[:player_id])
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    if @answer.save
      redirect_to players_path
    else
      render 'new'
    end
  end

  def index
    @answers = Answer.all
  end

  def show
    @answer = Answer.find(params[:id])
  end

  private
  def answer_params
    params.require(:answer).permit(:correct, :question_id, :player_id)
  end
end
