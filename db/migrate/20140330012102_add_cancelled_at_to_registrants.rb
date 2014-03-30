class AddCancelledAtToRegistrants < ActiveRecord::Migration
  def change
    add_column :registrants, :cancelled_at, :datetime
  end
end
