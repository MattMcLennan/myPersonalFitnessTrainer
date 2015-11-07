class Exercise < ActiveRecord::Base
  belongs_to :user

  validates :bench,
    :deadlift,
    :squat,
    :overhead_press,
    :barbell_row,
    :barbell_shrug,
    :tricep_extension,
    :barbell_curl,
    :close_grip_bench,
    :cable_crunches,
    :pullups,
    numericality: { only_integer: true }
end
