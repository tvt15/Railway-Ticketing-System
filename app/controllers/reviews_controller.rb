class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]

  # GET /reviews or /reviews.json
  def index
    @reviews = Review.all
    @admins = Admin.all
  end

  # GET /reviews/1 or /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
    if @train.nil?
      @train = Train.find(params[:train_id])
    end
  end

  # GET /reviews/1/edit
  def edit
    if @train.nil?
      @train = Train.find(params[:train_id])
    end
    if @review.passenger_id == session[:passenger_id] || session[:admin_id] != nil

    else
      redirect_to root_path, error: "Not allowed to access this page"
    end
  end

  # POST /reviews or /reviews.json
  def create
    if session[:passenger_id] != nil
      pid = Passenger.find(session[:passenger_id]) 
    else
      pid = Admin.find(session[:admin_id])
    end
    puts pid.id
    @review = Review.new(review_params)
    @review.passenger_id = pid.id
    @train = Train.find_by(id: @review[:train_id])

    respond_to do |format|
      if @review.save
        format.html { redirect_to review_url(@review), notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to review_url(@review), notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

# Filter by train number for all reviews 
def search_review_by_train_number
  if params[:train_number].blank?
    if session[:passenger_id] != nil
      redirect_to passengers_path and return
    else
      redirect_to review_show_route_path and return
    end
  else
    @result_reviews = Array.new
    @reviews = Review.all
    @reviews.each do |review|
      @train = Train.find_by_id(review.train_id)
      if @train && @train.train_number == params[:train_number]
        @result_reviews.append(review)
      end
    end
    puts @result_reviews
  end
end

# Filter by train number for all reviews 
def search_review_by_passenger_name
  if params[:passenger_name].blank?
    if session[:passenger_id] != nil
      redirect_to passengers_path and return
    else
      redirect_to review_show_route_path and return
    end
  else
    @result_reviews_passenger = Array.new
    @reviews = Review.all
    @reviews.each do |review|
      @passenger = Passenger.find_by_id(review.passenger_id)
      if @passenger && @passenger.name == params[:passenger_name]
        @result_reviews_passenger.append(review)
      end
    end
    puts @result_reviews_passenger
  end
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:rating, :feedback, :train_id)
    end
end
