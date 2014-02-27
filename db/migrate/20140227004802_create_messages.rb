class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end
