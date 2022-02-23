class Space < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_one_attached :photo
<<<<<<< HEAD
=======

>>>>>>> fca453c8dd5ef66f720917528426cee5be859e74
end
