class AddLanguageToRegistrant < ActiveRecord::Migration
  def change
    change_table :registrants do |t|
      t.string :language
    end
  end
end
