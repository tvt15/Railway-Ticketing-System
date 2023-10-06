class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy ]
  # GET /tickets or /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1 or /tickets/1.json
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    if @train.nil?
      @train = Train.find(params[:train_id])
    end
  end
  # GET /tickets/1/edit
  def edit
    if @train.nil?
      @train = Train.find(params[:train_id])
    end
  end

  # POST /tickets or /tickets.json
  def create   
    p = params["ticket"][:non_model_ticket_cnt] 
    if session[:passenger_id] != nil
      pid = Passenger.find(session[:passenger_id]).id
    else
      pid = "admin"
    end
    p.to_i.times do
      @ticket = Ticket.new(ticket_params)
      @ticket.booked_by = pid
      @ticket.confirmation_number = Array.new(10){[*"A".."Z", *"0".."9"].sample}.join
      @train = Train.find_by(id: @ticket[:train_id])
      @train.seats_left = @train.seats_left - 1
      @train.save
      @ticket.save
    end
      respond_to do |format|
        if @ticket.save
          format.html { redirect_to ticket_url(@ticket), notice: "Ticket was booked successfully." }
          format.json { render ticket_url(@ticket), status: :created, location: @ticket }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @ticket.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy
    @train = Train.find_by(id: @ticket[:train_id])
    @train.seats_left = @train.seats_left + 1
    @train.save
    if Review.find_by(train_id: @train[:id])
      Review.where(:train_id => @train[:id]).destroy_all
    end
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to tickets_url, notice: "Ticket was successfully cancelled." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    #Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:train_id, :passenger_id)   
    end
end
