class DiscountCode < ApplicationRecord
  belongs_to :event

  validates :code, presence: true

  validates :discount_percentage, presence: true,
          numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 100 }
  validates :expiry, presence: true

  validates :max_uses, presence: true,
          numericality: { only_integer: true, greater_than: 0 }
          
end
