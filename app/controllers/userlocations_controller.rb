class UserlocationsController < ApplicationController
  def index
    @locations = Userlocation.all
    @location  = Userlocation.new
  end
  
  def create
    @locations = Userlocation.all
    @location = Userlocation.new(location_params)
    if @location.location_name.blank?
      render "userlocations/index"
    elsif @location.address.present?
      @location.save
      redirect_to userlocations_path,notice: "保存しました"
    elsif @location.latitude.present?
      @location.save
      redirect_to userlocations_path,notice: "保存しました"
    else
      render "userlocations/index"
    end
  end
  def edit
    @location = Userlocation.find(params[:id])
  end
  def update
    @location = Userlocation.find(params[:id])
    @location.update(location_params)
    redirect_to userlocations_path
  end
  def destroy
    @location = Userlocation.find(params[:id])
    @location.destroy
    redirect_to userlocations_path
  end
  private
  def location_params
    params.require(:userlocation).permit(:location_type, :latitude, :longitude, :address, :location_name)
  end
end
