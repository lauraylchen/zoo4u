class Animal < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :animal_type, :description, presence: true
end
