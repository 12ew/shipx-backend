class Api::V1::TravelersController < ApplicationController
  before_action :find_traveler, only: [:update, :trips]

  def index
    @travelers = Traveler.all
    render json: @travelers
  end

  def show
    @traveler = Traveler.find(params[:id])
    render json: @traveler
  end

  def create
    @traveler = Traveler.new(traveler_params)
    if @traveler.save
      render json: @traveler, status: :accepted
    else
      render json: { errors: @traveler.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    @traveler.update(traveler_params)
    if @traveler.save
      render json: @traveler, status: :accepted
    else
      render json: { errors: @traveler.errors.full_messages }, status: :unprocessible_entity
    end
  end

  # def trips
  #   @my_trips = @traveler.trips
  #   render json: @my_trips
  # end

  private

  def traveler_params
    params.permit(:name, :email, :password, :phone_number, :street, :city, :zip_code, :identification_num, :status, :category)
  end

  def find_traveler
    @traveler = Traveler.find(params[:id])
  end

end
