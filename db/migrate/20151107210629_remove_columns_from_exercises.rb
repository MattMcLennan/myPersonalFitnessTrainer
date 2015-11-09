class RemoveColumnsFromExercises < ActiveRecord::Migration
  def change
    remove_column :exercises, :chinups, :integer
    remove_column :exercises, :pullups, :integer
    remove_column :exercises, :routine, :string
  end
end
