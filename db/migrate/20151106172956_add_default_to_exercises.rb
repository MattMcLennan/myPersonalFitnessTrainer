class AddDefaultToExercises < ActiveRecord::Migration
  def change
    change_column_default(:exercises, :bench, 0)
    change_column_default(:exercises, :deadlift, 0)
    change_column_default(:exercises, :squat, 0)
    change_column_default(:exercises, :overhead_press, 0)
    change_column_default(:exercises, :barbell_row, 0)
    change_column_default(:exercises, :barbell_shrug, 0)
    change_column_default(:exercises, :tricep_extension, 0)
    change_column_default(:exercises, :barbell_curl, 0)
    change_column_default(:exercises, :close_grip_bench, 0)
    change_column_default(:exercises, :cable_crunches, 0)
  end
end
