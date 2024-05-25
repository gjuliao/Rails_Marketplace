class ProductsController < ApplicationController
  def index
    @products = Product.all
    @user = current_user
  end

  def new
    @product = Product.new
  end

  def show
    @user = current_user
    @product = Product.includes(comments: :author).find(params[:id])
    @like = current_user.likes.find_by(product_id: @product.id)
  end

  def create
    product = Product.create(product_params)
    if product.save
      flash[:notice] = 'Product was succesfully saved!'
      redirect_to user_product_path(current_user, product)
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
      redirect_to user_product_path(current_user, @product)
    else
      flash[:alert] = 'There was an error updating the product.'
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:notice] = 'Product was deleted succesfully!'
      redirect_to products_path
    else
      flash[:alert] = 'There was an error deleting the product.'
      redirect_to products_path(product)
    end
  end

  def my_products
    @users_products = current_user.products.all
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :assistants, :comments, :owner_id)
  end
end
