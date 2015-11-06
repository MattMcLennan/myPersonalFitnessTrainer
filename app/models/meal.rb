class Meal < ActiveRecord::Base
  belongs_to :user

  BREAKFAST_TARGET_ALLOCATION = 0.25
  SNACK1_TARGET_ALLOCATION = 0.075
  LUNCH_TARGET_ALLOCATION = 0.20
  SNACK2_TARGET_ALLOCATION = 0.075
  DINNER_TARGET_ALLOCATION = 0.25
  SNACK3_TARGET_ALLOCATION = 0.05

  BREAKFAST_ITEM1_ALLOCATION = 0.80
  BREAKFAST_ITEM2_ALLOCATION = 0.80
  
  SNACK1_ITEM1_ALLOCATION = 0.80
  SNACK1_ITEM2_ALLOCATION = 0.80
  
  LUNCH_ITEM1_ALLOCATION = 0.80
  LUNCH_ITEM2_ALLOCATION = 0.80
  
  SNACK2_ITEM1_ALLOCATION = 0.80
  SNACK2_ITEM2_ALLOCATION = 0.80
  
  
  DINNER_ITEM1_ALLOCATION = 0.80
  DINNER_ITEM2_ALLOCATION = 0.80
  
  SNACK3_ITEM1_ALLOCATION = 0.80
  SNACK3_ITEM2_ALLOCATION = 0.80
  
  def self.algo
    # Defined by user
    user_cals_target = 2000
    nutrition_content = ["calories", "protein", "carbs", "fat"]

    breakfast_target = user_cals_target * BREAKFAST_TARGET_ALLOCATION
    snack1_target = user_cals_target * SNACK1_TARGET_ALLOCATION
    lunch_target = user_cals_target * LUNCH_TARGET_ALLOCATION
    snack2_target = user_cals_target * SNACK2_TARGET_ALLOCATION
    dinner_target = user_cals_target * DINNER_TARGET_ALLOCATION
    snack3_target = user_cals_target * SNACK3_TARGET_ALLOCATION

    
    # Storing an empty daily_meal object to iterate over
    daily_meal = { breakfast: {}, snack1: {}, lunch: {}, snack2: {}, dinner: {}, snack3: {} }

    daily_meal.each do |meal_category, value|
      find = Meal.where("category LIKE ?", meal_category.to_s.capitalize)

      # case needed for unique cases
      case meal_category
      when :breakfast
        meal_category = {
          item1: {
            name: find[0].food,
            grams: ((find[0].per_grams / find[0].calories.to_f) * (breakfast_target * BREAKFAST_ITEM1_ALLOCATION)).round(-1)
          },
          item2: {
            name: find[1].food,
            grams: ((find[1].per_grams / find[1].calories.to_f) * (breakfast_target * BREAKFAST_ITEM2_ALLOCATION)).round(-1)
          }
        }
        puts "breakfast"
      when :snack1
        puts "snack1"
      when :lunch
        puts "lunch"
      when :snack2
        puts "snack2"
      when :dinner
        # Hard coded find to search for Lunch as that is the food category name in the DB
        # Foods meant for lunch or dinner can be interchanged
        find = Meal.where("category LIKE ?", "Lunch")
        puts "dinner"
      when :snack3
        puts "snack3"
      end

      def set_meal_category_items(meal_category, find, meal_target, item_allocation)
        meal_category = {
          item1: {
            name: find[0].food,
            grams: ((find[0].per_grams / find[0].calories.to_f) * (breakfast_target * BREAKFAST_ITEM1_ALLOCATION)).round(-1)
          },
          item2: {
            name: find[1].food,
            grams: ((find[1].per_grams / find[1].calories.to_f) * (breakfast_target * BREAKFAST_ITEM2_ALLOCATION)).round(-1)
          }
        }
      end




    end



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

    nutrition_content.each do |content|
      self.generate_meal_category(breakfast_list, breakfast_plan, "item1", content, breakfast_item1)
      self.generate_meal_category(breakfast_list, breakfast_plan, "item2", content, breakfast_item2)
    end






















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

    nutrition_content.each do |content|
      self.generate_meal_category(snack1_list, snack1_plan, "item1", content, snack1_item1)
      self.generate_meal_category(snack1_list, snack1_plan, "item2", content, snack1_item2)
    end

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

    nutrition_content.each do |content|
      self.generate_meal_category(lunch_list, lunch_plan, "item1", content, lunch_item1)
      self.generate_meal_category(lunch_list, lunch_plan, "item2", content, lunch_item2)
    end

    # Snack 2
    snack2_list = Meal.where("category LIKE ?","Snack 2")
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

    nutrition_content.each do |content|
      self.generate_meal_category(snack2_list, snack2_plan, "item1", content, snack2_item1)
      self.generate_meal_category(snack2_list, snack2_plan, "item2", content, snack2_item2)
    end

    # Dinner
    dinner_list = Meal.where("category LIKE ?","Lunch")
    dinner_item1 = Random.rand(dinner_list.length)
    dinner_item2 = Random.rand(dinner_list.length)

    dinner_plan = {
      item1: {
        name: dinner_list[dinner_item1].food,
        grams: ((dinner_list[dinner_item1].per_grams / dinner_list[dinner_item1].calories.to_f) * (dinner_target * 0.5)).round(-1)
      },
      item2: {
        name: dinner_list[dinner_item2].food,
        grams: ((dinner_list[dinner_item2].per_grams / dinner_list[dinner_item2].calories.to_f) * (dinner_target * 0.5)).round(-1)
      }
    }

    nutrition_content.each do |content|
      self.generate_meal_category(dinner_list, dinner_plan, "item1", content, dinner_item1)
      self.generate_meal_category(dinner_list, dinner_plan, "item2", content, dinner_item2)
    end


    # Snack 3
    snack3_list = Meal.where("category LIKE ?","Snack 3")
    snack3_item1 = Random.rand(snack3_list.length)
    snack3_item2 = Random.rand(snack3_list.length)

    snack3_plan = {
      item1: {
        name: snack3_list[snack3_item1].food,
        grams: ((snack3_list[snack3_item1].per_grams / snack3_list[snack3_item1].calories.to_f) * (snack3_target * 0.5)).round(-1)
      },
      item2: {
        name: snack3_list[snack3_item2].food,
        grams: ((snack3_list[snack3_item2].per_grams / snack3_list[snack3_item2].calories.to_f) * (snack3_target * 0.5)).round(-1)
      }
    }

    nutrition_content.each do |content|
      self.generate_meal_category(snack3_list, snack3_plan, "item1", content, snack3_item1)
      self.generate_meal_category(snack3_list, snack3_plan, "item2", content, snack3_item2)
    end

    binding.pry
  end

  def self.generate_meal_category(food_list, meal_category, item_key, nutrition_category, category_item) 
    meal_category[item_key.to_sym][nutrition_category.to_sym] = ((food_list[category_item][nutrition_category.to_sym] / food_list[category_item]["per_grams"].to_f) * meal_category[item_key.to_sym][:grams]).round(-1)
  end 

end
