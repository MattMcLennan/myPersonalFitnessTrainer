class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.references :user, index: true
      t.integer :bench
      t.integer :deadlift
      t.integer :squat
      t.integer :overhead_press
      t.integer :barbell_row
      t.integer :barbell_shrug
      t.integer :tricep_extension
      t.integer :barbell_curl
      t.integer :close_grip_bench
      t.integer :cable_crunches

      t.timestamps
    end
  end
end
