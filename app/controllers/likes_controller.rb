class LikesController < ApplicationController

  def new
    @like = Like.new
  end

  def create
    @product = Product.find_by(id: params[:product_id])
    @user = User.find_by(id: params[:user_id])
    @like = Like.create(like_params)
    if @like.save
      flash[:notice] = 'Like saved succesfully'
      redirect_to user_product_path(@user, @product)
    else
      flash.now[:alert] = 'Like not saved.  Please try again'
      render 'product#show'
    end
  end

  def destroy
    @product = Product.find_by(id: params[:product_id])
    @like = Like.find(params[:id])
    if @like.destroy
      flash[:notice] = 'Like succesfully deleted'
      redirect_to user_product_path(current_user, @product)
    else
      flash.now[:alert] = 'Like not deleted.  Please try again'
      redirect_to root_path
    end
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :product_id)
  end
end
