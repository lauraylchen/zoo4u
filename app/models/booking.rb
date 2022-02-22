class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :animal

  # validates :start_date, :end_date, presence: true
  validate :end_date_is_after_start_date
  # validates :status, inclusion: { in: (0..2) }
  
  enum status: {
    pending: 0,
    confirmed: 1,
    declined: 2
  }

  validates :status, inclusion: { in: statuses.keys }

  def end_date_is_after_start_date
    if end_date < start_date
      errors.add(:end_date, 'cannot be before the start date')
    end
  end
end
