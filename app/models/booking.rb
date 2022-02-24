class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :space
  has_many :reviews, dependent: :destroy
end
