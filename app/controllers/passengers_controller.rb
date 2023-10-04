class PassengersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  before_action :set_passenger, only: %i[ show edit update destroy ]
 
  # before_action :redirect_to_root, only: [:index]

  # GET /passengers or /passengers.json
  def index
    @passengers = Passenger.all
    @admins = Admin.all
  end

  # GET /passengers/1 or /passengers/1.json
  def show
    if @passenger.id == session[:passenger_id] || session[:admin_id] != nil
    
    else
      redirect_to root_path, error: "Not allowed to access this page"
    end
  end

  # GET /passengers/new
  def new
    @passenger = Passenger.new
  end

  # GET /passengers/1/edit
  def edit
  end

  # POST /passengers or /passengers.json
  def create
    @passenger = Passenger.new(passenger_params)

    respond_to do |format|
      if @passenger.save
        format.html { redirect_to passenger_url(@passenger), notice: "Passenger was successfully created." }
        format.json { render passenger_url(@passenger), status: :created, location: @passenger }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @passenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /passengers/1 or /passengers/1.json
  def update
    respond_to do |format|
      if @passenger.update(passenger_params)
        format.html { redirect_to passenger_url(@passenger), notice: "Passenger was successfully updated." }
        format.json { render :show, status: :ok, location: @passenger }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @passenger.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passengers/1 or /passengers/1.json
  def destroy
    if Review.find_by(passenger_id: @passenger.id)
      Review.where(:passenger_id => @passenger.id).destroy_all
    end
    if @ticket = Ticket.find_by(passenger_id: @passenger.id)
      Ticket.where(:passenger_id => @passenger.id).destroy_all
    end
    @passenger.destroy
    session[:passenger_id] = nil
    if session[:admin_id] != nil
      respond_to do |format|
        format.html { redirect_to admins_path, notice: "Passenger was successfully destroyed." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path, notice: "Passenger was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  
# Filter by train number for all reviews 
def search_passenger_by_train_number
  if params[:train_number].blank?
      redirect_to admins_path and return
  else
    @result_passenger = Array.new
    @train = Train.find_by(:train_number => params[:train_number])
    if @train == nil
      redirect_to admins_path and return
    end
    @tickets = Ticket.all
    @tickets.each do |ticket|
      if ticket.train_id == @train.id
        @result_passenger.append(ticket.passenger_id)
      end
    end
    end
    puts @result_passenger
  
end

  private
    def redirect_to_root
      redirect_to root_path
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_passenger
      @passenger = Passenger.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def passenger_params
      params.require(:passenger).permit(:name, :email, :password, :phone, :address, :credit_card)
    end
end
