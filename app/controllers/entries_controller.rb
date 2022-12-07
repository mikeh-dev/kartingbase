class EntriesController < ApplicationController
  def index
    @entries = Entries.all
  end
end
