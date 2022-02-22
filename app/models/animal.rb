class Animal < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :type, :description, presence: true
end
