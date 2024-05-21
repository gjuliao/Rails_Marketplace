class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :product, counter_cache: :comments_counter

  after_create :update_products_comments_count

  def update_products_comments_count
    product.comments_counter = product.comments.count
    if save
      Rails.logger.info "Product #{product.id} comments_counter updated to #{product.comments_counter}"
    else
      Rails.logger.error "Failed to update comments_counter for Product #{product.id}"
    end
  end
end
