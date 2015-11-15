class UserlocationsController < ApplicationController
  def index
    @locations = Userlocation.all
  end
  
  def create
    @location = Userlocation.new(location)
    if @location.address.present?
      @location.save
    elsif @location.latitude.present?
      @location.save
    else
      @location = "現在地が取得できませんでした。"
    end
    @locations = Userlocation.all
    render "index"
  end
  
  private
  def location
    params.require(:userlocation).permit(:latitude, :longitude, :address)
  end
end
