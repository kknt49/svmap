class PicturesController < ApplicationController
  before_action :redirect, only: [:index, :new, :edit, :show]
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = Picture.all
  end


  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end


  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end

  def create
    require 'exifr/jpeg'
    @location = Location.last
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    
    @picture.lat = @location.latitude
    @picture.lon = @location.longitude
    
    @picture.image.retrieve_from_cache! params[:cache][:image]
    @picture.save!
    
    if @picture.save
      ContactMailer.contact_mail(current_user).deliver 
      redirect_to pictures_path, notice: "写真をアップしました！"
    else
      render 'new'
    end
  end


  def update
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "写真を編集しました！"
    else
      render 'edit'
    end
  end  
  

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice:"写真を削除しました！"
  end

  
  def confirm
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    
    render :new if @picture.invalid?
  end



  def redirect
    unless logged_in?
      redirect_to new_session_path
    end
  end
  
  
  private
  
  
  def picture_params
    params.require(:picture).permit(:image, :image_cache, :content, :lat, :lon, :cate, :modelname)
  end

  def set_picture
    @picture = Picture.find(params[:id])
  end
end