class UserlocationsController < ApplicationController
  def index
    @locations = Userlocation.all
  end
  
  def create
    @locations = Userlocation.new(location)
    @locations.save
    redirect_to root_path
  end
  
  private
  def location
    params.require(:userlocation).permit(:latitude, :longitude, :address)
  end
end
