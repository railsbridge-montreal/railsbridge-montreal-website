class Registrant < ActiveRecord::Base

  validates :name, presence: true
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  scope :unplaced, -> { where(course: nil, cancelled_at: nil) }
  scope :placed, -> { where("course is not null and cancelled_at is null") }
  scope :active, -> { where(cancelled_at: nil, waitlisted: false) }

end
