class AddAvatarToCheeses < ActiveRecord::Migration[5.0]
  def change
    add_column :cheeses, :avatar, :string
  end
end
