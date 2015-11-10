class Exercise < ActiveRecord::Base
  belongs_to :user

  validates :bench,
    :deadlift,
    :squat,
    :overhead_press,
    :barbell_row,
    :tricep_extension,
    :barbell_curl,
    :cable_crunches,
    :calf_raise,
    :pullups,
    :bench_reps,
    :deadlift_reps,
    :squat_reps,
    :overhead_press_reps,
    :barbell_row_reps,
    :tricep_extension_reps,
    :barbell_curl_reps,
    :cable_crunches_reps,
    :calf_raise_reps,
    :pullup_reps,
    numericality: { greater_than_or_equal_to: 0 }
    
    # START_SQUAT = @exercise.squat
    # START_BENCH = @exercise.bench
    # START_DEADLIFT = @exercise.deadlift
    # START_OHP = @exercise.overhead_press
    # START_BARBELL_ROW = @exercise.barbell_row
    #
    # END_SQUAT = @exercise.squat * (1 + 0.025 * @exercise.squat_reps)
    # END_BENCH = @exercise.bench * (1 + 0.025 * @exercise.bench_reps)
    # END_DEADLIFT = @exercise.deadlift * (1 + 0.025 * @exercise.deadlift_reps)
    # END_OHP = @exercise.overhead_press * (1 + 0.025 * @exercise.overhead_press_reps)
    # END_BARBELL_ROW = @exercise.barbell_row * (1 + 0.025 * @exercise.barbell_row_reps)

end
