class ReviewsController < ApplicationController
  before_action :set_rental, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.rental = @rental
    if @review.save!
      redirect_to rentals_path, notice: "Review created. Thank you!"
      flash[:notice] = "Review created. Thank you!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating, :rental_id)
  end
end
