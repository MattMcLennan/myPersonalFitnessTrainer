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
      },
      item2: {
        name: breakfast_list[1].food,
        grams: ((breakfast_list[1].per_grams / breakfast_list[1].calories.to_f) * (breakfast_target * 0.20)).round(-1)
      }
    }

    breakfast_item1 = 0
    breakfast_item2 = 1

    self.generate_meal_category(breakfast_list, breakfast_plan, "item1", "calories", breakfast_item1)
    self.generate_meal_category(breakfast_list, breakfast_plan, "item1", "protein", breakfast_item1)
    self.generate_meal_category(breakfast_list, breakfast_plan, "item1", "carbs", breakfast_item1)
    self.generate_meal_category(breakfast_list, breakfast_plan, "item1", "fat", breakfast_item1)
    self.generate_meal_category(breakfast_list, breakfast_plan, "item2", "calories", breakfast_item2)
    self.generate_meal_category(breakfast_list, breakfast_plan, "item2", "protein", breakfast_item2)
    self.generate_meal_category(breakfast_list, breakfast_plan, "item2", "carbs", breakfast_item2)
    self.generate_meal_category(breakfast_list, breakfast_plan, "item2", "fat", breakfast_item2)

    # Snack 1
    snack1_list = Meal.where("category LIKE ?","Snack 1")
    snack1_item1 = Random.rand(snack1_list.length)
    snack1_item2 = Random.rand(snack1_list.length)

    snack1_plan = {
      item1: {
        name: snack1_list[snack1_item1].food,
        grams: ((snack1_list[snack1_item1].per_grams / snack1_list[snack1_item1].calories.to_f) * (snack1_target * 0.5)).round(-1)
      },
      item2: {
        name: snack1_list[snack1_item2].food,
        grams: ((snack1_list[snack1_item2].per_grams / snack1_list[snack1_item2].calories.to_f) * (snack1_target * 0.5)).round(-1)
      }
    }

    self.generate_meal_category(snack1_list, snack1_plan, "item1", "calories", snack1_item1)
    self.generate_meal_category(snack1_list, snack1_plan, "item1", "protein", snack1_item1)
    self.generate_meal_category(snack1_list, snack1_plan, "item1", "carbs", snack1_item1)
    self.generate_meal_category(snack1_list, snack1_plan, "item1", "fat", snack1_item1)
    self.generate_meal_category(snack1_list, snack1_plan, "item2", "calories", snack1_item2)
    self.generate_meal_category(snack1_list, snack1_plan, "item2", "protein", snack1_item2)
    self.generate_meal_category(snack1_list, snack1_plan, "item2", "carbs", snack1_item2)
    self.generate_meal_category(snack1_list, snack1_plan, "item2", "fat", snack1_item2)



    # Lunch
    lunch_list = Meal.where("category LIKE ?","Snack 1")
    lunch_item1 = Random.rand(lunch_list.length)
    lunch_item2 = Random.rand(lunch_list.length)

    lunch_plan = {
      item1: {
        name: lunch_list[lunch_item1].food,
        grams: ((lunch_list[lunch_item1].per_grams / lunch_list[lunch_item1].calories.to_f) * (snack1_target * 0.5)).round(-1)
      },
      item2: {
        name: lunch_list[lunch_item2].food,
        grams: ((lunch_list[lunch_item2].per_grams / lunch_list[lunch_item2].calories.to_f) * (snack1_target * 0.5)).round(-1)
      }
    }

    self.generate_meal_category(lunch_list, lunch_plan, "item1", "calories", lunch_item1)
    self.generate_meal_category(lunch_list, lunch_plan, "item1", "protein", lunch_item1)
    self.generate_meal_category(lunch_list, lunch_plan, "item1", "carbs", lunch_item1)
    self.generate_meal_category(lunch_list, lunch_plan, "item1", "fat", lunch_item1)
    self.generate_meal_category(lunch_list, lunch_plan, "item2", "calories", lunch_item2)
    self.generate_meal_category(lunch_list, lunch_plan, "item2", "protein", lunch_item2)
    self.generate_meal_category(lunch_list, lunch_plan, "item2", "carbs", lunch_item2)
    self.generate_meal_category(lunch_list, lunch_plan, "item2", "fat", lunch_item2)


    # Snack 2
    snack2_list = Meal.where("category LIKE ?","Snack 1")
    snack2_item1 = Random.rand(snack2_list.length)
    snack2_item2 = Random.rand(snack2_list.length)

    snack2_plan = {
      item1: {
        name: snack2_list[snack2_item1].food,
        grams: ((snack2_list[snack2_item1].per_grams / snack2_list[snack2_item1].calories.to_f) * (snack2_target * 0.5)).round(-1)
      },
      item2: {
        name: snack2_list[snack2_item2].food,
        grams: ((snack2_list[snack2_item2].per_grams / snack2_list[snack2_item2].calories.to_f) * (snack2_target * 0.5)).round(-1)
      }
    }

    self.generate_meal_category(snack2_list, snack2_plan, "item1", "calories", snack2_item1)
    self.generate_meal_category(snack2_list, snack2_plan, "item1", "protein", snack2_item1)
    self.generate_meal_category(snack2_list, snack2_plan, "item1", "carbs", snack2_item1)
    self.generate_meal_category(snack2_list, snack2_plan, "item1", "fat", snack2_item1)
    self.generate_meal_category(snack2_list, snack2_plan, "item2", "calories", snack2_item2)
    self.generate_meal_category(snack2_list, snack2_plan, "item2", "protein", snack2_item2)
    self.generate_meal_category(snack2_list, snack2_plan, "item2", "carbs", snack2_item2)
    self.generate_meal_category(snack2_list, snack2_plan, "item2", "fat", snack2_item2)


















    binding.pry
  end

  def self.generate_meal_category(food_list, meal_category, item_key, nutrition_category, category_item) 
    meal_category[item_key.to_sym][nutrition_category.to_sym] = ((food_list[category_item][nutrition_category.to_sym] / food_list[category_item]["per_grams"].to_f) * meal_category[item_key.to_sym][:grams]).round(-1)
  end 

end
