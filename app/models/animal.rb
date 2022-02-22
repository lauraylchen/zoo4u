class Animal < ApplicationRecord
  belongs_to :user
  validates :user_id, :name, :animal_type, :description, presence: true
end
