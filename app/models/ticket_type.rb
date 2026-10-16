class TicketType < ApplicationRecord
  belongs_to :event
  has_many :booking_items, dependent: :restrict_with_error
end
