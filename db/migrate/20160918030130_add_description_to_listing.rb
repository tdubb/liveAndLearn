class AddDescriptionToListing < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :description, :string
  end
end
