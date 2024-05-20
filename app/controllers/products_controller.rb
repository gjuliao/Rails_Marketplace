class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    product = Product.create(product_params)
    if product.save
      flash[:notice] = 'Product was succesfully saved!'
      redirect_to product
    else
      flash[:alert] = 'There was an error creating the product.'
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update!(product_params)
      flash[:notice] = 'Product was succesfully update!'
      redirect_to @product
    else
      flash[:alert] = 'There was an error updating the product.'
      render 'edit'
    end
  end

  def delete; end

  private

  def product_params
    params.require(:product).permit(:name, :description, :assistants, :comments, :user_id)
  end
end
