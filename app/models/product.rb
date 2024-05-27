class Product < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  belongs_to :category
  has_many :comments, dependent: :destroy, counter_cache: true
  has_many :likes, dependent: :destroy, counter_cache: true
  has_many :events, dependent: :destroy, counter_cache: true

  validates :name, :description, :assistants, presence: true

  def recent_comments
    comments.order(created_at: :desc)
  end
end
