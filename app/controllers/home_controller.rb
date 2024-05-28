class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @q_events = Event.ransack(params[:q])
    @q_products = Product.ransack(params[:q])

     @events = @q_events.result(distinct: true)
     @products = @q_products.result(distinct: true)

     @results = @events + @products

     @results = @results.sort_by(&:created_at)
     @categories = Category.all
  end
end
