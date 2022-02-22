class AnimalsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @animals = Animal.all
  end
end
