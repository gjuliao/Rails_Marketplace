class Category < ApplicationRecord
  has_many :products

  #   DEFAULT_CATEGORIES = %w[Sport Family Art].freeze

  #   before_initialize :ensure_default_categories, if: :new_record?

  #   private

  #   def ensure_default_categories
  #     DEFAULT_CATEGORIES.each do |category|
  #       Category.find_or_create_by(name: category)
  #     end
  #   end
end
