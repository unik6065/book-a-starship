class StarshipsController < ApplicationController
  before_action :set_starship, only: %i[show update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @starships = Starship.all
  end

  def new
    @starship = Starship.new
  end

  def create
    @starship = Starship.new(starship_params)
    @starship.loaner_id = current_user.id
    if @starship.save
      redirect_to starship_path(@starship)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @starship.update(params[:starship])
      redirect_to starship_path(@starship)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @starship.destroy
    redirect_to starships_path, status: :see_other
  end

  private

  def set_starship
    @starship = Starship.find(params[:id])
  end

  def starship_params
    params.require(:starship).permit(:name, :description, :pickup_city, :price_per_day, photos: [])
  end
end
