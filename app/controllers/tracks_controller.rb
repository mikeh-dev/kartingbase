class TracksController < ApplicationController
  def show
    @track = Track.find(params[:id])
  end

  def index
    @tracks = Track.all
  end

  def new
    @track = Track.new
  end

  def track_params
    params.require(:track).permit(:name, :image, :latitude, :longitude)
  end

end
