class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  # def booking_params
  #   params.require(:user).permit(:user, :animal, :start_date, :end_date, :status, :created_at, :updated_at)
  # end
end
