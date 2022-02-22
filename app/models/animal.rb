class Animal < ApplicationRecord
  belongs_to :user
  validates :user_id, :name, :animal_type, :description, presence: true
  has_one_attached :photo
end
