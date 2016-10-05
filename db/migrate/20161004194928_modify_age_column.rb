class ModifyAgeColumn < ActiveRecord::Migration[5.0]
  def up
    change_column :cheeses, :age, :string
  end

  def down
    change_column :cheeses, :age, 'integer USING CAST(age AS integer)'
  end
end
