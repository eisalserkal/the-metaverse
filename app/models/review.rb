class Review < ApplicationRecord
  belongs_to :booking
  has_one :user, through: :booking, dependent: :destroy
  has_one :space, through: :booking, dependent: :destroy
end
