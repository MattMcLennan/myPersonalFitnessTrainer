class RemoveCloseGripBenchFromExercises < ActiveRecord::Migration
  def change
    remove_column :exercises, :close_grip_bench, :string
  end
end
