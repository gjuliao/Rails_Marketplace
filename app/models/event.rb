class Event < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :bookings
  validates :end_date, comparison: { greater_than: :start_date }
  validates :end_time, comparison: { greater_than: :start_time }
  validates :start_date,
            :end_date,
            :start_time,
            :end_time,
            :total_sits,
            :remaining_sits,
            :product_id,
            :user_id,
            presence: true

  before_create :set_remaining_sits

  def set_remaining_sits
    self.remaining_sits = total_sits
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[product user]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at end_date end_time id id_value product_id remaining_sits start_date
       start_time total_sits updated_at user_id]
  end
end
