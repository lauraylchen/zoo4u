class BookingsController < ApplicationController

  # def index
  #   @bookings = Booking.all
  # end

  def my_bookings
    @bookings = Booking.where(user_id: current_user.id)
  end

  def new
    set_animal
    @booking = Booking.new
  end

  def create
    set_animal
    @booking = Booking.new(booking_params)
    @booking.animal = @animal
    @booking.user = current_user
    if @booking.save
      redirect_to my_bookings_path
    else
      render :new
    end
  end

  def duration_calculator(start_date, end_date)
    if end_date == start_date
      1
    else
      end_date - start_date
    end
  end

  private

  def set_animal
    @animal = Animal.find(params[:animal_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
