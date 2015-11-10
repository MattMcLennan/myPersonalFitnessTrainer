class AddRepsToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :bench_reps, :integer, default: 0
    add_column :exercises, :deadlift_reps, :integer, default: 0
    add_column :exercises, :squat_reps, :integer, default: 0
    add_column :exercises, :overhead_press_reps, :integer, default: 0
    add_column :exercises, :barbell_row_reps, :integer, default: 0
    add_column :exercises, :tricep_extension_reps, :integer, default: 0
    add_column :exercises, :barbell_curl_reps, :integer, default: 0
    add_column :exercises, :cable_crunches_reps, :integer, default: 0
    add_column :exercises, :calf_raise_reps, :integer, default: 0
    add_column :exercises, :pullup_reps, :integer, default: 0
  end
end
