class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.string :email
      t.string :ruby_version
      t.string :ruby_platform

      t.timestamps
    end
  end
end
