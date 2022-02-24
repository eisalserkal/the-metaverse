class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space
  has_many :reviews, dependent: :destroy
  validates_uniqueness_of :booking_date, scope: :space_id
end
