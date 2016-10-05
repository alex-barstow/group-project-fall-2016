class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.text :body
      t.integer :user_id, null: false
      t.integer :cheese_id, null: false
    end
  end
end
