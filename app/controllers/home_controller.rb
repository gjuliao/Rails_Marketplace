class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @q_events = Event.ransack(params[:q])
    @q_products = Product.ransack(params[:q])

    @events = @q_events.result(distinct: true).paginate(page: params[:events_page], per_page: 6)
    @products = @q_products.result(distinct: true).paginate(page: params[:products_page], per_page: 6)

    @results = (@events + @products).sort_by(&:created_at)

    @categories = Category.all

    @all_products = Product.all
  end
end
