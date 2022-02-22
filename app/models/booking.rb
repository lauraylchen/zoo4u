class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :animal

  validates :start_date, :end_date, presence: true
  validates :start_date, comparison: { less_than_or_equal_to: :end_date }
  validates :status, inclusion: { in: (0..2) }

  # enum status: {
  #   pending: 0,
  #   confirmed: 1,
  #   declined: 2
  # }
end
