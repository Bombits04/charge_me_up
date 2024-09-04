class CreateChgSpots < ActiveRecord::Migration[7.1]
  def change
    create_table :chg_spots do |t|
      t.string :name
      t.string :region
      t.string :province
      t.string :city
      t.string :barangay
      t.string :address
      t.boolean :is_approved
      t.integer :upvote
      t.integer :downvote
      t.string :created_by
      t.integer :user_id
      t.integer :lat
      t.integer :lng

      t.timestamps
    end
  end
end
