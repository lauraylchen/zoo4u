class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :animals
  has_many :bookings
  has_many :owner_bookings, through: :animals, source: :bookings
  has_one_attached :photo

  validates :username, presence: true, uniqueness: true
end
