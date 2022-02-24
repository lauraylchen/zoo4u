class AnimalsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:animal_type].present?
      @animals = Animal.where("animal_type ILIKE ?", "%#{params[:animal_type]}%")
    else
      @animals = Animal.all
    end
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def my_animals
    @animals = Animal.where(user_id: current_user.id)
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user
    if @animal.save
      redirect_to animal_path(@animal)
    else
      render :new
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :animal_type, :description, :price, :photo)
  end
end
