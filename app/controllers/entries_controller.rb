class EntriesController < ApplicationController
  before_action :set_entry, only: %i[ show edit update destroy ]

  def index
    @entries = Entry.all
  end

  def show
  end

  def edit
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
      if @entry.save
        flash.now[:notice] = "Entry Saved!"
        render entry_path
      else
        flash.now[:alert] = "Incomplete Entry!"
        render new_entry_path, status: :unprocessable_entity
      end
  end

  def destroy
    @entry.destroy
    flash[:notice] = "Entry has been Deleted!"
    redirect_to entries_url, status: :see_other
  end

  def update
    if @entry.update(entry_params)
      flash[:success] = "Entry was successfully updated."
      redirect_to entry_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end


  private

  def entry_params
    params.require(:entry).permit(:sessionnotes, :run) 
  end

  def set_entry
    @entry = Entry.find(params[:id])
  end


end
