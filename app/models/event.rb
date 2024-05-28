class Event < ApplicationRecord
  belongs_to :product
  belongs_to :user

  def self.ransackable_associations(_auth_object = nil)
    %w[product user]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at end_date end_time id id_value product_id remaining_sits start_date
       start_time total_sits updated_at user_id]
  end
end
