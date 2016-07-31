class CreateEditions < ActiveRecord::Migration
  def change
    create_table :editions do |t|
      t.string :name
      t.datetime :installfest
      t.datetime :workshop, default: false
      t.boolean :registrations_open

      t.timestamps null: false
    end

    add_column :registrants, :edition_id, :integer

    last_edition = Edition.create(
      name: "RailsBridge 2014",
      installfest: Date.new(2014, 10, 17),
      workshop: Date.new(2014, 10, 18)
    )

    this_edition = Edition.create(
      name: "RailsBridge 4th edition",
      installfest: Date.new(2016, 9, 23),
      workshop: Date.new(2016, 9, 24),
      registrations_open: true
    )

    Registrant.update_all(edition_id: last_edition.id)
  end
end
