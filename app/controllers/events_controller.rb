class EventsController < ApplicationController

    def new
        @event = Event.new
        @product = Product.find(params[:product_id])
    end

    def create
    end
end
