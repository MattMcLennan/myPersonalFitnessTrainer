class ChangeDefaultOnExercises < ActiveRecord::Migration
  def change
    change_column_default :exercises, :squat, nil
    change_column_default :exercises, :bench, nil
    change_column_default :exercises, :deadlift, nil
    change_column_default :exercises, :overhead_press, nil
    change_column_default :exercises, :barbell_row, nil
    change_column_default :exercises, :barbell_shrug, nil
    change_column_default :exercises, :tricep_extension, nil
    change_column_default :exercises, :barbell_curl, nil
    change_column_default :exercises, :close_grip_bench, nil
    change_column_default :exercises, :cable_crunches, nil
    change_column_default :exercises, :hyperextensions, nil
  end
end
