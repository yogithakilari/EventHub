class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy
  has_many :bookings, dependent: :destroy

  before_validation :set_default_approval_status, on: :create


  validates :email, uniqueness: { case_sensitive: false }

  validates :phone_number,
  format: { with: /\A[6-9]\d{9}\z/ },
  presence: true

  validates :role, inclusion: { in: ["attendee", "organiser", "admin"] }

  validates :approval_status, inclusion: { in: ["pending", "approved", "rejected"] }, if: -> { role == "organiser" }

  validates :name, presence: true
  
  private
  
  def set_default_approval_status
    self.approval_status = "pending" if role == "organiser" && approval_status.blank?
  end
end
