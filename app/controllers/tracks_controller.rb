class TracksController < ApplicationController
  
  def index
    @tracks = Track.all
  end

  def show
    @track = Track.find(params[:id])
  end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url
    else
     render 'new', status: :unprocessable_entity    
    end
  end

  private

  def track_params
    params.require(:track).permit(:name)
   end

end
