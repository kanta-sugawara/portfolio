class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.string :title, null: false
      t.text :body, null: false
      t.float :rate, null: false, default: 0
      t.integer :total_time, null: false
      t.integer :total_charge, null: false
      t.string :review_image_id

      t.timestamps
    end
  end
end
