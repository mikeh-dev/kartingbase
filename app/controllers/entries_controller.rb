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
        render 'show'
      else
        flash.now[:alert] = "Incomplete Entry!"
        render 'new'
      end
  end

  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: "Entry was successfully deleted." }
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: "Entry was successfully updated." }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
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
