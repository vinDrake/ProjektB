class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def create
    @challenge = Challenge.find("2")
    @ticket = @challenge.tickets.create(ticket_params)
    if @ticket.save
      redirect_to challenge_path(@challenge)
    else
      render 'new'
    end
  end

  def index
    @tickets = Ticket.all
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  private
  def ticket_params
    tp = params.require(:ticket).permit(:player_id, :challenge_id)
    tp[:player_id] = session[:player_id]
    return tp
  end
end
