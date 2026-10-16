class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :event

  has_many :booking_items, dependent: :destroy

  validates :ticket_quantity, presence: true,
          numericality: { only_integer: true, greater_than: 0 }

  validates :amount_paid, presence: true,
          numericality: { greater_than_or_equal_to: 0 }

  validates :discount, numericality: { greater_than_or_equal_to: 0 }

  validates :booking_status,
          inclusion: { in: ["pending", "confirmed", "cancelled"] }

  validates :booking_reference, presence: true, uniqueness: true
  
end
