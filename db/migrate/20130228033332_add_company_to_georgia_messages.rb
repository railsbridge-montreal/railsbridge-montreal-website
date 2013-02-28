class AddCompanyToGeorgiaMessages < ActiveRecord::Migration
  def change
    add_column :georgia_messages, :company, :string
  end
end