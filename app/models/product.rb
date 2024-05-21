class Product < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_many :comments, dependent: :destroy, counter_cache: true

  validates :name, :description, :assistants, presence: true
end
