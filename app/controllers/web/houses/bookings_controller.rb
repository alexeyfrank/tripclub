class Web::Houses::BookingsController < Web::Houses::ApplicationController
  layout false

  def new
    @booking = House::Booking.new
  end

  def create
    if resource_house.bookings.create permitted_params
      render :success
    else
      render :new
    end
  end

  def permitted_params
    params.require(:house_booking).permit!
  end
end
