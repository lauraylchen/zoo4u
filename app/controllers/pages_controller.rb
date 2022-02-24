require "open-uri"

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @animals = Animal.all
  end

  def user_profile
  end


  def update_user

    if current_user.update(user_params)
    
      # Notice not working?
      render :user_profile, notice: "Update successful!"
     
    else
      render :user_profile
    end
  end


  def user_params
    params.require(:user).permit(:email, :password, :username, :photo)
  end
end
