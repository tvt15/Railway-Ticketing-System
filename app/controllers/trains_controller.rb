class TrainsController < ApplicationController
  before_action :set_train, only: %i[ show edit update destroy ]

  # GET /trains or /trains.json
  def index
    @trains = Train.all
  end

  # GET /trains/1 or /trains/1.json
  def show
  end

  # GET /trains/new
  def new
    @train = Train.new
  end

  # GET /trains/1/edit
  def edit
  end

  # POST /trains or /trains.json
  def create
    @train = Train.new(train_params)

    respond_to do |format|
      if @train.save
        format.html { redirect_to train_show_route_path, notice: "Train was successfully created." }
        format.json { render :show, status: :created, location: @train }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @train.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trains/1 or /trains/1.json
  def update
    respond_to do |format|
      if @train.update(train_params)
        format.html { redirect_to train_url(@train), notice: "Train was successfully updated." }
        format.json { render :show, status: :ok, location: @train }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @train.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trains/1 or /trains/1.json
  def destroy
    if @review = Review.find_by(train_id: @train[:id])
      Review.where(:train_id => @train[:id]).destroy_all
    end

    if @ticket = Ticket.find_by(train_id: @train[:id])
      Ticket.where(:train_id => @train[:id]).destroy_all
    end
    @train.destroy

    respond_to do |format|
      format.html { redirect_to trains_url, notice: "Train was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def trainstation_filter
    if params[:departure_station].blank? && params[:termination_station].blank?
      if session[:passenger_id] != nil
        redirect_to ptrain_show_route_path and return
      else
        redirect_to train_show_route_path and return
      end
    elsif params[:termination_station].blank?
      @result_station = Array.new
      @trains = Train.all
      @trains.each do |train|
        if train.departure_station.upcase == params[:departure_station].upcase
          @result_station.append(train)
        end
      end
      puts @result_station
    elsif params[:departure_station].blank?
      @result_station = Array.new
      @trains = Train.all
      @trains.each do |train|
        if train.termination_station.upcase == params[:termination_station].upcase
          @result_station.append(train)
        end
      end
      puts @result_station
    else
      @result_station = Array.new
      @trains = Train.all
      @trains.each do |train|
        if train.termination_station.upcase == params[:termination_station].upcase && train.departure_station.upcase == params[:departure_station].upcase
          @result_station.append(train)
        end
      end
      puts @result_station
    end
  end


  def filter_by_rating
    if params[:min_rating].blank?
      redirect_to trains_url and return
    else
      @rating = params[:min_rating].to_i
      # @trains.where("AVG(ratings.score) >=
      @result_trains = Train.all
      @result_array, @result_average = filter_trains_on_avg_rating(@result_trains, params[:min_rating].to_i)
    end
  end

  def filter_trains_on_avg_rating(trains, min_rating)
    result_array = Array.new
    result_average = Array.new
    trains.each do |train|
      reviews = Review.all.where(train_id: train.id)
      total_rating = 0
      total_size = 0
      average_rating = 0
      reviews.each do |review|
        total_rating += review.rating
        total_size += 1
      end
      if total_size != 0
        average_rating = total_rating / total_size
      end
      if average_rating >= min_rating
        result_array.append(train)
        result_average.append(average_rating)
      end

    end

    return result_array, result_average
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_train
      @train = Train.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def train_params
      params.require(:train).permit(:train_number, :departure_station, :termination_station, :departure_date, :departure_time, :arrival_date, :arrival_time, :ticket_price, :train_capacity, :seats_left)
    end
end
