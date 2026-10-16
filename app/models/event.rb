class Event < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :ticket_types, dependent: :destroy
  has_many :bookings, dependent: :restrict_with_error
  has_many :discount_codes, dependent: :destroy
end
