class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event

  has_many :booking_items, dependent: :destroy
end
