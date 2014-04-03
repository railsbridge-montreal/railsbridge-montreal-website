class RenameCourseToLevel < ActiveRecord::Migration
  def change
    rename_column :registrants, :course, :level
  end
end
