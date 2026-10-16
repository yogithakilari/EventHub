class Category < ApplicationRecord
  has_many :events, dependent: :restrict_with_error
end
