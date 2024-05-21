class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :product, class_name: 'Product', foreign_key: :product_id

  after_create :update_products_comments_count

  # def update_products_comments_count
  #   Rails.logger.info "Executing after_create callback for Comment #{id}"
  #   product.reload
  #   if product.update(comments_counter: product.comments.count)
  #     Rails.logger.info "Product #{product.id} comments_counter updated to #{product.comments_counter}"
  #   else
  #     Rails.logger.error "Failed to update comments_counter for Product #{product.id}"
  #   end
  # end

  private

  def update_products_comments_count
    product.update(comments_counter: product.comments.count)
  end
end
