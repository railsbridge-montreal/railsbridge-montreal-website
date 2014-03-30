class AddWaitlistedToRegistrants < ActiveRecord::Migration
  def change
    add_column :registrants, :waitlisted, :boolean, default: false
  end
end
