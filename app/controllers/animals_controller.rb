class AnimalsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @animals = Animal.all
  end

  def show
    @animal = Animal.find(params[:id])
  end
end
