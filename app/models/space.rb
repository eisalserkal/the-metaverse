class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  has_many :games, dependent: :destroy
  has_one_attached :photo, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_name_location_vr,
  against: [ :name, :location, :vr_headset],
  using: {
    tsearch: {prefix: true}
  }
end
