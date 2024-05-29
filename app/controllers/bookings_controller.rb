class BookingsController < ApplicationController

    def new
        @booking = Booking.new
        @event = Event.find(params[:event_id])
    end

    def create
        @booking = Booking.create(bookings_params)
        @event = Event.find(params[:event_id])
        @product = Product.find(params[:product_id])
        if @booking.save!
            flash[:notice] = 'Booking created succesfully'
            redirect_to root_path
        else
            flash.now[:alert] = 'Booking not created succesfully'
            render :new
        end
    end

    def purchase_event
        @event = params[:event_id]
        @product = params[:product_id]
    end

    private

    def bookings_params
        params.require(:booking).permit(:no_of_tickets, :event_id, :customer_id)
    end
end