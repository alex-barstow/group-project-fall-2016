class CreateCheeses < ActiveRecord::Migration[5.0]
  def change
    create_table :cheeses do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
      t.integer :age
      t.text :description
    end
  end
end
