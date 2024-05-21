class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :product

  before_create :update_products_comments_count

  private

  def update_products_comments_count
    product.comments_counter = product.comments.count
  end
end
