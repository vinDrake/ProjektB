class PlayersController < ApplicationController

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      session[:player_id] = @player.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
    # @questions = Question.all
    # size = @questions.size
    # @player.question_feed = Array.new( 1 + rand(size), 1 + rand(size)).delete_at(0).to_s
    # if @player.save
    #   redirect_to '/players'
    # else
    #   render 'new'
    # end

  end

  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
    @questions = Question.all
    size = @questions.size
    @question = Question.find(size-1 )#+ rand(size))
    if @player.question_feed
      @question_feed = @player.question_feed.split(',').collect! {|n| n.to_i}
    else
      @question_feed = [1 + rand(size)]
    end

    @question_feed.delete(0)

    while @question_feed.size < 10
      @question_feed += [1 + rand(size)]
    end
#    @player.question_feed = @question_feed.to_s
    @player.update(:question_feed => @question_feed.to_s)
    @question = Question.find(@question_feed.last)
  end

  def edit
  end

  def update
  end

  private
  def player_params
    params.require(:player).permit(:name, :email, :password)
  end

end
