class Course < ActiveRecord::Base
  has_many :registrants
end
