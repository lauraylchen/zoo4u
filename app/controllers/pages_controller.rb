class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @animals = Animal.all
  end

  def user_profile
    # Show page essentially for the user profile
  end


  def update_user

    if current_user.update(user_params)
    
      redirect_to user_profile_path, notice: "Profile updated!"
     
    else
      render :user_profile
    end
  end


  def user_params
    params.require(:user).permit(:email, :password, :username, :photo)
  end
end
