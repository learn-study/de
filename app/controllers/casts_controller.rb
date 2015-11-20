class CastsController < ApplicationController
  def index
    @casts = Cast.all
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
  
  private
  def cast_params
    params.require(:cast).permit(:name, :age, :b, :w, :hip, :cup, :message, :comment, :tall)
  end
end
