class Product < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  belongs_to :category
  has_many :comments, dependent: :destroy, counter_cache: true
  has_many :likes, dependent: :destroy, counter_cache: true
  has_many :events, dependent: :destroy, counter_cache: true

  validates :name, :description, :assistants, presence: true

  before_validation :set_default_category, on: :create

  private

  def recent_comments
    comments.order(created_at: :desc)
  end

  def set_default_category
    self.category ||= Category.find_or_create_by(name: 'Default')
  end
end
