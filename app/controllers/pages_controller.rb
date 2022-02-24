require "open-uri"

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @animals = Animal.all
  end

  def user_profile
  end


  def update_user

    # file = URI.open(user_params[:photo])
    # # raise
    # current_user.photo.attach(io: file, filename: "avatar#{current_user.id}.png", content_type: 'image/png')

    if current_user.update(user_params)
      
      # file = URI.open(user_params[:photo])
      # # raise
      # current_user.photo.attach(io: file, filename: "avatar#{current_user.id}.png", content_type: 'image/png')
      # render :user_profile
      # # raise
    
    else
      render :user_profile
    end
  end


  def user_params
    params.require(:user).permit(:email, :password, :username, :photo)
  end
end
