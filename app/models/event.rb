class Event < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :ticket_types, dependent: :destroy
  has_many :bookings, dependent: :restrict_with_error
  has_many :discount_codes, dependent: :destroy

  validates :title, presence: true

  validates :description, presence: true
  
  validates :venue_name, presence: true
  
  validates :city, presence: true

  validates :start_time, presence: true

  validates :end_time, presence: true

  validates :status, inclusion: { in: ["draft", "published", "cancelled"] }

  validate :end_time_after_start_time
  
  private
  
  def end_time_after_start_time
    return if start_time.blank? || end_time.blank?
    
    errors.add(:end_time, "must be after the start time") if end_time <= start_time
  end

end
