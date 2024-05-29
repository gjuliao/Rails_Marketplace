class CommentsController < ApplicationController
  before_action :find_product, only: %w[new create]
  def new
    @comment = Comment.new
    @user = current_user
  end

  def show; end

  def create
    unless @product
      flash[:alert] = 'Sorry product not found.'
      redirect_to user_product_path(current_user, @product)
    end

    @comment = Comment.create(comment_params)
    if @comment.save
      flash.now[:notice] = 'Comment succesfully created'
      redirect_to user_product_path(current_user, @product)
    else
      flash.now[:alert] = 'Sorry comment not created, try again.'
      render 'products/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :product_id, :author_id)
  end

  def find_product
    @product = Product.find(params[:product_id])
  end
end
