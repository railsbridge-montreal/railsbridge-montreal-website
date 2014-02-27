class Message < ActiveRecord::Base

  validates :email, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :message, presence: true

end