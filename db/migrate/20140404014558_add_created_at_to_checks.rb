class AddCreatedAtToChecks < ActiveRecord::Migration
  def change
    add_column :checks, :created_at, :datetime
  end
end
