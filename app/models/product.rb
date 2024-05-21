class Product < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  has_many :comments

  validates :name, :description, :assistants, presence: true
end
