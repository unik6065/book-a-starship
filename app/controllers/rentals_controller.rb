class RentalsController < ApplicationController
  before_action :set_rental, only: %i[show edit update destroy accept decline]

  # Index only shows rentals for the current user

  def bookings
    @rentals = Rental.where(renter: current_user)
  end

  def requests
    @rentals = Rental.joins(:starship).where(starship: { loaner_id: current_user.id })
  end

  def new
    @rental = Rental.new
    @starship = Starship.find(params[:starship_id])
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.renter_id = current_user.id
    @rental.starship_id = params[:starship_id]
    # rental price is calculated by multiplying the price per day of the starship
    # by the number of days and is at minimum equal to the price per day
    @rental.price = [@rental.starship.price_per_day * (@rental.end_date - @rental.start_date).to_i, @rental.starship.price_per_day].max
    if @rental.save
      redirect_to rentals_path
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

  # This method is called when the user clicks on the "Accept" button on the rental
  # The rental ID is passed as a parameter
  # It changes the status of the rental to "accepted"
  def accept
    @rental.status = :accepted
    @rental.save
    redirect_to rentals_path, notice: 'Rental accepted.'
    flash[:notice] = "Rental accepted."
  end

  # This method is called when the user clicks on the "Decline" button on the rental
  # The rental ID is passed as a parameter
  # It changes the status of the rental to "declined"
  def decline
    @rental.status = :declined
    @rental.save
    redirect_to rentals_path, notice: 'Rental declined.'
    flash[:notice] = "Rental declined."
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :starship_id)
  end
end
