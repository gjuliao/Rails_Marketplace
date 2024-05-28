class EventsController < ApplicationController
  def new
    @event = Event.new
    @product = Product.find(params[:product_id])
  end

  def create
    @event = Event.create(event_params)
    @product = Product.find(params[:product_id])
    if @event.save!
      flash[:notice] = 'Event created successfully!'
      redirect_to user_product_event_path(current_user, @product, @event)
    else
      flash.now[:alert] = 'Event not created successfully!'
      redirect_to new_user_product_event_path(@product)
    end
  end

  def show
    @event = Event.find(params[:id])
    @product = Product.find(params[:product_id])
  end

  def edit
    @event = Event.find(params[:id])
    @product = Product.find(params[:product_id])
  end

  def update
    @event = Event.find(params[:id])
    @product = Product.find(params[:product_id])
    if @event.update!(event_params)
      flash[:notice] = 'Event updated succesfully'
      redirect_to user_product_event_path(current_user, @product, @event)
    else
      flash.now[:alert] = 'Event not updated'
      redirect_to edit_user_product_event(current_user, @product, @event)
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @product = Product.find(params[:product_id])
    if @event.destroy!
      flash[:notice] = 'Event deleted succesfully'
      redirect_to user_product(current_user, @product)
    else
      flash[:alert] = 'Event not succesfully deleted'
      redirect_to user_product_event_path(current_user, @product, @event)
    end
  end

  def my_events
    @users_events = Event.includes(:product).where(user_id: current_user.id)
  end

  def all_events
    @events = Event.all
  end

  private

  def event_params
    params.require(:event)
      .permit(:start_date, :end_date, :start_time, :end_time, :total_sits, :product_id, :user_id)
  end
end
