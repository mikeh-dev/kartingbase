class EntriesController < ApplicationController
  before_action :current_user,   only: [:edit, :update, :index, :destroy]

  def index
    @entries = Entry.all
  end

  def show
    @entry = Entry.find(params[:id])
  end
end
