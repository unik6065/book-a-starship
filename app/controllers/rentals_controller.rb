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
      redirect_to bookings_rentals_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @rental.update(rental_params)
      redirect_to bookings_rentals_path(@rental)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @rental.destroy
    redirect_to bookings_rentals_path, notice: 'Rental was successfully canceled.'
    flash[:notice] = "Rental was successfully canceled."
  end

  def show
  end

  # This method is called when the user clicks on the "Accept" button on the rental
  # The rental ID is passed as a parameter
  # It changes the status of the rental to "accepted"
  def accept
    @rental.status = :accepted
    @rental.save
    redirect_to bookings_rentals_path(@rental), notice: 'Booking accepted.'
    flash[:notice] = "Booking accepted."
  end

  # This method is called when the user clicks on the "Decline" button on the rental
  # The rental ID is passed as a parameter
  # It changes the status of the rental to "declined"
  def decline
    @rental.status = :declined
    @rental.save
    redirect_to bookings_rentals_path(@rental), notice: 'Booking declined.'
    flash[:notice] = "Booking declined."
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :starship_id)
  end
end
