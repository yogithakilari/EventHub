class BookingItem < ApplicationRecord
  belongs_to :booking
  belongs_to :ticket_type
end
