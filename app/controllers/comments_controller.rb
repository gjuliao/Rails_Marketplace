class CommentsController < ApplicationController

    def new
        @comment = Comment.new
        @product = Product.find(params[:product_id])
        @user = current_user
    end

    def show
        @comments_product = Product.find_by(id: params[:owner_id])
        @comments = product.comments
    end

    def create
        product = Product.find_by(id: params[:owner_id])
        @author = current_user
        unless product
            flash[:alert] = 'Sorry product not found.'
            render product_path(product)
        end

        @comment = Comment.create(comment_params)
        if @comment.save
            flash[:notice] = 'Comment succesfully created'
            redirect_to product_path(product)
        else
            flash.now[:alert] = 'Sorry comment not created, try again.'
            render 'products/show'
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:text, :product_id, :author_id)
    end
end
