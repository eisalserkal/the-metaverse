class Review < ApplicationRecord
  belongs_to :booking
  has_one :user, through: :booking, dependent: :destroy
  has_one :space, through: :booking, dependent: :destroy
  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
