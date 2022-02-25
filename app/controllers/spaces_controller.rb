class SpacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if params[:query].present?
      @spaces = Space.search_by_name_location_vr(params[:query])
    else
      @spaces = Space.all
    end

    @markers = @spaces.geocoded.map do |space|
      {
        lat: space.latitude,
        lng: space.longitude,
        info_window: render_to_string(partial: "info_window", locals: { space: space })
      }
    end
  end

  def listings
    @spaces = policy_scope(Space).order(created_at: :desc)
  end

  def show
    @space = Space.find(params[:id])
    authorize @space
    @booking = Booking.new
    @booking.space = @space
    if @space.vr_headset == 'HTC Vive' || @space.vr_headset == 'Valve Index'
      @space.games = 'Batman: Arkham VR, Beat Saber, Blade and Sorcery, Catlateral Damage, Dota 2, Elite Dangerous'
    elsif @space.vr_headset == 'Oculus Quest' || @space.vr_headset == 'Oculus Rift'
      @space.games = 'American Truck Simulator, Assetto Corsa, Elite Dangerous, Gunjack, Edge of Nowhere, Subnautica, The Solus Project'
    elsif @space.vr_headset == 'Playstation VR'
      @space.games = 'Ace Combat 7: Skies Unknown, Ark: Survival Evolved, Batman: Arkham VR, Blood & Truth, Catlateral Damage, Dead Secret, Dirt Rally'
    end
  end

  def new
    @space = Space.new
    authorize @space
  end

  def create
    @space = Space.new(space_params)
    @space.user = current_user
    authorize @space
    if @space.save
      redirect_to space_path(@space)
    else
      render :new
    end
  end

  def edit
    @space = Space.find(params[:id])
    authorize @space
  end

  def update
    @space = Space.find(params[:id])
    authorize @space
    @space.update(space_params)
    redirect_to space_path(@space)
  end

  def destroy
    @space = Space.find(params[:id])
    authorize @space
    @space.destroy

    redirect_to listings_path
  end

  private

  def space_params
    params.require(:space).permit(:name, :location, :hourly_rate, :vr_headset, :photo, :overview)
  end
end
