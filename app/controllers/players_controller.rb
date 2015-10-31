class PlayersController < ApplicationController
  before_action :require_player, only: [:index, :show]
  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    @questions = Question.all
    size = @questions.size
    @player.question_feed = Array.new( 1 + rand(size), 1 + rand(size)).delete_at(0).to_s

    if @player.save
      session[:player_id] = @player.id
      redirect_to '/players'
    else
      redirect_to '/signup'
    end


  end

  def index
    @players = Player.all
  end

  def show
    @session = session
    @player = Player.find(@session[:player_id])
    @duels = @player.duels
  #  @player = Player.find(params[:id])
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
