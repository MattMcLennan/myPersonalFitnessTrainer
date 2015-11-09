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
    numericality: { greater_than_or_equal_to: 0 }
end
