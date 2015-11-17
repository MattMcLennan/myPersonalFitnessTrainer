class RemoveExercises < ActiveRecord::Migration
  def change
    remove_column :exercises, :pullup_reps, :string
    remove_column :exercises, :calf_raise_reps, :string
    remove_column :exercises, :cable_crunches_reps, :string
    remove_column :exercises, :barbell_curl_reps, :string
    remove_column :exercises, :tricep_extension_reps, :string
    remove_column :exercises, :calf_raise, :string
    remove_column :exercises, :cable_crunches, :string
    remove_column :exercises, :barbell_curl, :string
    remove_column :exercises, :tricep_extension, :string
  end
end
