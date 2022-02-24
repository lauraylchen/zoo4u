class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @animals = Animal.all
  end

  def user_profile
  end


  def update_user
    if current_user.update(user_params)
    
    else
      render :user_profile
    end
  end


  def user_params
    params.require(:user).permit(:email, :password, :username, :photo)
  end
end
