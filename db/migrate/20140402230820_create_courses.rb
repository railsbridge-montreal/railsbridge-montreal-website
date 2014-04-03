class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.string :language
      t.string :teachers
      t.string :room
      t.string :event

      t.timestamps
    end
  end
end
