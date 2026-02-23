class EntriesController < ApplicationController
  def new
    @place = Place.find(params[:place_id])
    @entry = Entry.new(place: @place)
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.save
      redirect_to place_path(@entry.place_id)
    else
      @place = Place.find(entry_params[:place_id])
      render :new
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :description, :occurred_on, :place_id)
  end
end
