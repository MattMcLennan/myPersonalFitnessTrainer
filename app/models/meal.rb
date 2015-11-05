class Meal < ActiveRecord::Base
  belongs_to :user


  def self.algo
    calories_target = 2000
    protein_target = 0.40 * calories_target
    carbs_target = 0.40 * calories_target
    fat_target = 0.20 * calories_target
    nutrition_target = [calories_target, protein_target, carbs_target, fat_target]

    breakfast_target = calories_target * 0.25
    snack1_target = calories_target * 0.075
    lunch_target = calories_target * 0.20
    snack2_target = calories_target * 0.075
    dinner_target = calories_target * 0.25
    snack3_target = calories_target * 0.05


    breakfast_list = Meal.where("category LIKE ?","Breakfast")
    breakfast_plan = {
      item1: {
        name: breakfast_list[0].food,
        grams: ((breakfast_list[0].per_grams / breakfast_list[0].calories.to_f) * (breakfast_target * 0.80)).round(-1)
      }
      item2: {
        name: breakfast_list[1].food,
        grams: (breakfast_list[1].calories / breakfast_list[1].per_grams) * (breakfast_target * 0.2),
      }
    }

    # Populating item1 breakfast
    breakfast_plan[:item1][:calories] = ((breakfast_list[0].calories / breakfast_list[0].per_grams.to_f) * breakfast_plan[:item1][:grams]).round(-1)
    breakfast_plan[:item1][:protein] = ((breakfast_list[0].protein / breakfast_list[0].per_grams.to_f) * breakfast_plan[:item1][:grams]).round(-1)
    breakfast_plan[:item1][:carbs] = ((breakfast_list[0].carbs / breakfast_list[0].per_grams.to_f) * breakfast_plan[:item1][:grams]).round(-1)
    breakfast_plan[:item1][:fat] = ((breakfast_list[0].fat / breakfast_list[0].per_grams.to_f) * breakfast_plan[:item1][:grams]).round(-1)

    # Populating item2 breakfast
    breakfast_plan[:items1][:calories] = ((breakfast_list[0].calories / breakfast_list[0].per_grams.to_f) * breakfast_plan[:items1][:grams]).round(-1)
    breakfast_plan[:items1][:protein] = ((breakfast_list[0].protein / breakfast_list[0].per_grams.to_f) * breakfast_plan[:items1][:grams]).round(-1)
    breakfast_plan[:items1][:carbs] = ((breakfast_list[0].carbs / breakfast_list[0].per_grams.to_f) * breakfast_plan[:items1][:grams]).round(-1)
    breakfast_plan[:items1][:fat] = ((breakfast_list[0].fat / breakfast_list[0].per_grams.to_f) * breakfast_plan[:items1][:grams]).round(-1)









  end
end
