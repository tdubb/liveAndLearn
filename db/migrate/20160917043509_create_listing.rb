class CreateListing < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.text :title
      t.string :body
      t.string :phone
      t.string :email
      t.date :date_available
      t.integer :price
      t.text :tags
    end
  end
end
