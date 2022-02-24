class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  has_many :games, dependent: :destroy
  has_one_attached :photo, dependent: :destroy

  validates :name, :location, :vr_headset, presence: true
  include PgSearch::Model
  pg_search_scope :search_by_name_location_vr,
  against: [ :name, :location, :vr_headset],
  using: {
    tsearch: {prefix: true}
  }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
