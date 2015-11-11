class RemoveExercisesFromExercises < ActiveRecord::Migration
  def change
    remove_column :exercises, :hyperextensions, :integer
    remove_column :exercises, :close_grip_bench, :integer
    remove_column :exercises, :barbell_shrug, :string
  end
end
