class BookingsController < ApplicationController
  
  # def index
  #   @bookings = Booking.all
  # end

  def my_bookings
    @bookings = Booking.where(id: current_user.id)
  end

end
