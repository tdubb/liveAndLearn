class CreatePhoto < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :image
      t.integer :listing_id
    end
  end
end
