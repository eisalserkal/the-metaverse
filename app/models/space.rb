class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  has_many :games, dependent: :destroy
  has_one_attached :photo, dependent: :destroy
end
