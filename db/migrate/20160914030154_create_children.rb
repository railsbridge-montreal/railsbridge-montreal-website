class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :email
      t.string :name
      t.integer :age
      t.string :special_needs

      t.timestamps null: false
    end
  end
end
