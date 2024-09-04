class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.integer :chg_spot_id
      t.integer :user_id
      t.text :comment
      t.boolean :is_cmt_approved

      t.timestamps
    end
  end
end
