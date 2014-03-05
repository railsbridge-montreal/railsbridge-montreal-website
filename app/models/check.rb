class Check < ActiveRecord::Base
  validates :email, :ruby_version, :ruby_platform, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
end
