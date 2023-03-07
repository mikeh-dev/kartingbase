class EntriesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]


  def index
    @entries = Entry.includes(:track).all
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def new
    @entry = current_user.entries.build(Entry.last_entry_data_for_user(current_user.id))
    @entry.date = Date.today
    @entry.time = Time.current.strftime('%H:%M:%S')
    @chassis = current_user.chassis
  end

  def create
    @entry = current_user.entries.build(entry_params)
    if @entry.save
      flash[:notice] = "Entry created!"
      redirect_to @entry
    else
      render :new, status: :unprocessable_entity
      flash[:notice] = "Entry not created!"
    end
  end

  def edit
    @entry = Entry.find(params[:id])
    @chassis = current_user.chassis
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update(entry_params)
      redirect_to @entry
    else
      render :edit
    end
  end

  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    redirect_to entries_path
  end

  def entry_params
    params.require(:entry).permit(:fuelload, :endfuel, :date, :run, :gearing, :prepressure, :postpressure, :rearwidth, :frontwidth, :needleclip, :jet, :bestlap, :secondbestlap, :thirdbestlap, :time, :airmix, :idle, :rimset, :tyre, :tyreset, :camber, :caster, :toe, :frontride, :rearride, :plug, :frontbar, :fuelmix, :condition, :chain, :axle, :endweight, :lapcount, :enginehour, :tyreage, :waddingage, :gearoilage, :sessiontype, :mainchanges, :sessionnotes, :besttoprevs, :bestbottomrevs, :secondbestlaptoprevs, :secondbestlapbottomrevs, :thirdbesttoprevs, :thirdbestbottomrevs, :highestrevs, :track_id, :chassis_id)
  end
  
  
end
