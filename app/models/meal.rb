class Meal < ActiveRecord::Base
  belongs_to :user

  def algo
    calories_target = 2000
    protein_target = 0.40 * calories_target
    carbs_target = 0.40 * calories_target
    fat_target = 0.20 * calories_target
    nutrition_target = [calories_target, protein_target, carbs_target, fat_target]

    breakfast_target=[]
    snack1_target=[]
    lunch_target=[]
    snack2_target=[]
    dinner_target=[]
    snack3_target=[]

    # Format for all targets is array with [cals, protein, carbs, fat]
    nutrition_target.each do |nutrition_category|
      breakfast_target.push(nutrition_category * 0.25)
      snack1_target.push(nutrition_category * 0.075)
      lunch_target.push(nutrition_category * 0.20)
      snack2_target.push(nutrition_category * 0.075)
      dinner_target.push(nutrition_category * 0.25)
      snack3_target.push(nutrition_category * 0.05)
    end

  end
end
