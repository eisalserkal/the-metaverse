class SpacesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @spaces = Space.all
  end

  def listings
    @spaces = policy_scope(Space).order(created_at: :desc)
  end

  def show
    @space = Space.find(params[:id])
    authorize @space
    @booking = Booking.new
    @booking.space = @space
  end

  def new
    @space = Space.new
    authorize @space
  end

  def create
    @space = Space.new(space_params)
    @space.user = current_user
    authorize @space
    @space.save
    redirect_to space_path(@space)
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

    redirect_to spaces_path
  end

  private

  def space_params
    params.require(:space).permit(:name, :location, :hourly_rate, :photo)
  end
end
