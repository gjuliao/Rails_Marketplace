class Product < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  belongs_to :category
  has_many :comments, dependent: :destroy, counter_cache: true
  has_many :likes, dependent: :destroy, counter_cache: true
  has_many :events, dependent: :destroy, counter_cache: true

  validates :name, :description, :assistants, presence: true
  validates :description, length: { minimum: 11, maximum: 100 }
  validates :name, length: { minimum: 3, maximum: 50 }

  before_validation :set_default_category, on: :create

  def self.ransackable_attributes(_auth_object = nil)
    %w[assistants category_id comments_counter created_at description id id_value like
       likes_counter name owner_id updated_at]
  end

  private

  def recent_comments
    comments.order(created_at: :desc)
  end

  def set_default_category
    self.category ||= Category.find_or_create_by(name: 'Default')
  end
end
