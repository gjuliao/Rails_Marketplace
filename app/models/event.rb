class Event < ApplicationRecord
  belongs_to :product
  belongs_to :user

  def self.ransackable_associations(auth_object = nil)
    ["product", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "end_date", "end_time", "id", "id_value", "product_id", "remaining_sits", "start_date", "start_time", "total_sits", "updated_at", "user_id"]
  end
end
