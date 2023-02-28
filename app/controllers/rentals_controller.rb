class RentalsController < ApplicationController
  before_action :set_rental, only: %i[show edit update destroy]
  def index
    @rentals = Rental.all
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.renter = current_user
    @rental.starship = Starship.find(params[:starship_id])
    if @rental.save
      redirect_to rental_path(@rental)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @rental.update(rental_params)
      redirect_to rental_path(@rental)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @rental.destroy
    redirect_to rentals_path status: :see_other
  end

  def show
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :starship_id)
  end
end
