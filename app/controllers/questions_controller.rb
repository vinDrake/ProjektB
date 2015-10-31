class QuestionsController < ApplicationController

  def new
    @question= Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to '/questions'
    else
      render 'new'
    end
  end

  def index
    @questions = Question.all
  end

  def show
    @player = Player.find(params[:player_id])
    @question = Question.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  def question_params
    params.require(:question).permit(:question_therm, :correct_answer, :wrong_answer)
  end

end
