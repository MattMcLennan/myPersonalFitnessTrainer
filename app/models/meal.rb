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
    # snack1_target=[]
    # lunch_target=[]
    # snack2_target=[]
    # dinner_target=[]
    # snack3_target=[]

    # Format for all targets is array with [cals, protein, carbs, fat]
    # nutrition_target.each do |nutrition_category|
    #   breakfast_target.push(nutrition_category * 0.25)
    #   # snack1_target.push(nutrition_category * 0.075)
    #   # lunch_target.push(nutrition_category * 0.20)
    #   # snack2_target.push(nutrition_category * 0.075)
    #   # dinner_target.push(nutrition_category * 0.25)
    #   # snack3_target.push(nutrition_category * 0.05)
    # end

    breakfast_list = Meal.where("category LIKE ?","Breakfast")
    breakfast_plan = {
      items1: {
        name: breakfast_list[0].food,
        grams: ((breakfast_list[0].per_grams / breakfast_list[0].calories.to_f) * (breakfast_target * 0.80)).round(-1)
        # calories: lambda { (breakfast_list[0].calories / breakfast_list[0].per_grams) * breakfast_plan[:calories]}
        # protein: lambda { (breakfast_list[0].calories / breakfast_list[0].per_grams) * breakfast_plan[:calories]}
        # carbs:  lambda { (breakfast_list[0].calories / breakfast_list[0].per_grams) * breakfast_plan[:calories]}
        # fat:  lambda { (breakfast_list[0].calories / breakfast_list[0].per_grams) * breakfast_plan[:calories]}
      }
      # item2: {
      #   name: breakfast_list[1].food,
      #   grams: (breakfast_list[1].calories / breakfast_list[1].per_grams) * (breakfast_target * 0.2),
      #   calories: calories_target * breakfast_target
      # }
    }

    # :hello => lambda { "Hello #{foo[:world]}" }}

    binding.pry
  end
end
