class Registrant < ActiveRecord::Base
  belongs_to :course

  delegate :name, :room, :teachers, to: :course, prefix: true

  validates :name, presence: true
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  scope :unplaced, -> { where(course: nil, cancelled_at: nil) }
  scope :placed, -> { where("course IS NOT NULL and cancelled_at IS NULL") }
  scope :active, -> { where(cancelled_at: nil, waitlisted: false) }

  def group
    [course_name, course_room].compact.join(', ')
  end

  def teachers
    course_teachers
  end
end
