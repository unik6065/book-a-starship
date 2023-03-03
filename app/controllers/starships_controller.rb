class StarshipsController < ApplicationController
  before_action :set_starship, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @starships = Starship.all
    @markers = @starships.geocoded.map do |starship|
      starship_marker(starship)
    end
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
    @markers = [starship_marker(@starship)]
  end

  def edit
  end

  def update
    if @starship.update(starship_params)
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

  def starship_marker(starship)
    {
      lat: starship.latitude,
      lng: starship.longitude,
      info_window_html: render_to_string(partial: "info_window", locals: {starship: starship}),
      marker_html: render_to_string(partial: "marker")
    }
  end

end
