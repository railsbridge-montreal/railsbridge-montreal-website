class AddFieldsToRegistrant < ActiveRecord::Migration
  def change
    change_table :registrants do |t|
      t.boolean :bringing_laptop
      t.text :special_needs
      t.string :course
    end
  end
end
