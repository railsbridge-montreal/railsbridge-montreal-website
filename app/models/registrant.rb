class Registrant < ActiveRecord::Base

  belongs_to :course
  belongs_to :edition

  delegate :name, :room, :teachers, to: :course, prefix: true

  validates :name, presence: true
  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  scope :unplaced, -> { active.where(course: nil) }
  scope :placed, -> { active.where.not(course: nil) }
  scope :active, -> { where(cancelled_at: nil, waitlisted: false) }
  scope :cancelled, -> { where.not(cancelled_at: nil) }
  scope :waitlisted, -> { where(waitlisted: true) }

  def group
    [course_name, course_room].compact.join(', ')
  end

  def teachers
    course_teachers
  end

end
