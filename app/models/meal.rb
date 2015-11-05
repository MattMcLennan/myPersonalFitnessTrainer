class Meal < ActiveRecord::Base
  belongs_to :user

  def algo
    calories_target = 2000
    protein_target = 0.40 * calories_target
    carbs_target = 0.40 * calories_target
    fat_target = 0.20 * calories_target

    puts calories_target
    puts protein_target
    puts carbs_target
    puts fat_target
  end
end
