class BookingsController < ApplicationController
  before_action :find_event, only: %w[new create purchase_event]
  before_action :find_product, only: %w[new create purchase_event]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(bookings_params)
    if @booking.save
      flash[:notice] = 'Booking created succesfully'
      redirect_to root_path
    else
      flash.now[:alert] = @booking.errors.full_messages.join(', ')
      render :new
    end
  end

  def purchase_event; end

  private

  def bookings_params
    params.require(:booking).permit(:no_of_tickets, :event_id, :customer_id)
  end

  def find_event
    @event = Event.find(params[:event_id])
  end

  def find_product
    @product = Product.find(params[:product_id])
  end
end
