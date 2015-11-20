class CastsController < ApplicationController
  def index
    @casts = Cast.all
  end
  def show
    @cast = Cast.find(params[:id])
    @profile = Profile.new
    @profiles= @cast.profiles.order("pr_no")
  end
  def new
    @cast = Cast.new
  end
  
  def create
    @cast = Cast.new(cast_params)
    if @cast.save
      redirect_to casts_path , notice: '新人追加しました。'
    else
      flash.now[:alert] = "登録に失敗しました。"
      render 'new'
    end
  end
  
  def edit
    @cast = Cast.find(params[:id])
  end
  
  def update
    @cast = Cast.find(params[:id])
    @cast.update_attributes(cast_params)
    redirect_to edit_cast_path(@cast)
  end
  
  def destroy
    @cast = Cast.find(params[:id])
    @cast.destroy
    redirect_to casts_path , notice: '削除しました。'
  end
  def create_profile
    @profile = Profile.new(profile_params)
    @profile.save
    @cast = Cast.find(params[:id])
    redirect_to @cast 
  end
  def destroy_profile
    @cast = Cast.find(params[:id])
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to @cast 
  end

  private
  def cast_params
    params.require(:cast).permit(:name, :age, :b, :w, :hip, :cup, :message, :comment, :tall)
  end
  def profile_params
    params.require(:profile).permit(:cast_id, :pr_no, :pr_body, :pr_item)
  end
end
