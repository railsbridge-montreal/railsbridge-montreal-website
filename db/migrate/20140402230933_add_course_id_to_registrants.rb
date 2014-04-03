class AddCourseIdToRegistrants < ActiveRecord::Migration
  def change
    add_column :registrants, :course_id, :integer
  end
end
