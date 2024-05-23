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
    @like = Like.find(params[:id])
    if @like.destroy
      flash[:notice] = 'Like succesfully deleted'
      # redirect to 'product_path'
    else
      flash.now[:alert] = 'Like not deleted.  Please try again'
      render 'product#show'
    end
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :product_id)
  end
end
