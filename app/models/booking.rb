class Booking < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :customer_id
  belongs_to :event

  validates :customer_id, :event_id, :no_of_tickets, presence: true

  after_create :update_event_remaining_sits

  validate :validate_remaining_sits

  def update_event_remaining_sits
    event.decrement(:remaining_sits, no_of_tickets).save
  end

  private

  def validate_remaining_sits
    return unless no_of_tickets > event.remaining_sits

    errors.add(:no_of_tickets, 'Cant be greater than number of sits')
  end
end
