class Booking < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :customer_id
  belongs_to :event

  validates :customer_id, :event_id, :no_of_tickets, presence: true
end
