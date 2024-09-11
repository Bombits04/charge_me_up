class CreateChgSpots < ActiveRecord::Migration[7.1]
  def change
    create_table :chg_spots do |t|
      t.string :name
      t.string :region
      t.string :province
      t.string :city
      t.string :address
      t.boolean :is_approved
      t.integer :score
      t.string :created_by
      t.string :updated_by
      t.integer :user_id
      t.string :lat
      t.string :lng
      t.string :place_id
      t.text :notes
      t.text :description

      t.timestamps
    end
  end
end
