class Review < ApplicationRecord
  belongs_to :booking
  has_one :user, through: :booking
  has_one :space, through: :booking
end
