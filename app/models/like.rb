class Like < ApplicationRecord
  belongs_to :user
  belongs_to :product

  after_save :update_product_like_count

  private

  def update_product_like_count
    product.likes_counter = product.likes.count
  end
end
