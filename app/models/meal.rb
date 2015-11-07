class Meal < ActiveRecord::Base
  BREAKFAST_TARGET_ALLOCATION = 0.25
  SNACK1_TARGET_ALLOCATION = 0.10
  LUNCH_TARGET_ALLOCATION = 0.25
  SNACK2_TARGET_ALLOCATION = 0.075
  DINNER_TARGET_ALLOCATION = 0.25
  SNACK3_TARGET_ALLOCATION = 0.075

  BREAKFAST_ITEM1_ALLOCATION = 0.80
  BREAKFAST_ITEM2_ALLOCATION = 0.20
  
  SNACK1_ITEM1_ALLOCATION = 0.60
  SNACK1_ITEM2_ALLOCATION = 0.40
  
  LUNCH_ITEM1_ALLOCATION = 0.80
  LUNCH_ITEM2_ALLOCATION = 0.20
  
  SNACK2_ITEM1_ALLOCATION = 0.50
  SNACK2_ITEM2_ALLOCATION = 0.50
  
  DINNER_ITEM1_ALLOCATION = 0.80
  DINNER_ITEM2_ALLOCATION = 0.20
  
  SNACK3_ITEM1_ALLOCATION = 1
  
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
      value = {
        item1: {
          name: "",
          grams: 0
          },
        item2: {
          name: "",
          grams: 0
        }
      }

      find = Meal.where("category LIKE ?", meal_category.to_s.capitalize)

      # case needed for unique cases
      case meal_category
      when :breakfast
        item1 = 0
        item2 = 1
        
        self.set_meal_category_items(value, "item1", find, breakfast_target, BREAKFAST_ITEM1_ALLOCATION, item1)
        self.set_meal_category_items(value, "item2", find, breakfast_target, BREAKFAST_ITEM2_ALLOCATION, item2)
        puts "breakfast"
        # binding.pry
      when :snack1
        item1 = Random.rand(find.length)
        item2 = Random.rand(find.length)

        self.set_meal_category_items(value, "item1", find, snack1_target, SNACK1_ITEM1_ALLOCATION, item1)
        self.set_meal_category_items(value, "item2", find, snack1_target, SNACK1_ITEM2_ALLOCATION, item2)
        puts "snack1"
        # binding.pry
      when :lunch
        item1 = Random.rand(find.length)
        self.set_meal_category_items(value, "item1", find, lunch_target, LUNCH_ITEM1_ALLOCATION, item1)

        find = Meal.where("category LIKE ?", "Snack1")
        item2 = Random.rand(find.length)

        self.set_meal_category_items(value, "item2", find, lunch_target, LUNCH_ITEM2_ALLOCATION, item2)
        puts "lunch"
        # binding.pry
      when :snack2
        item1 = Random.rand(find.length)
        item2 = Random.rand(find.length)

        self.set_meal_category_items(value, "item1", find, snack2_target, SNACK2_ITEM1_ALLOCATION, item1)
        self.set_meal_category_items(value, "item2", find, snack2_target, SNACK2_ITEM2_ALLOCATION, item2)
        puts "snack2"
        # binding.pry
      when :dinner
        # Hard coded find to search for Lunch as that is the food category name in the DB
        # Foods meant for lunch or dinner can be interchanged
        find = Meal.where("category LIKE ?", "Lunch")
        item1 = Random.rand(find.length)
        self.set_meal_category_items(value, "item1", find, dinner_target, DINNER_ITEM1_ALLOCATION, item1)
        
        find = Meal.where("category LIKE ?", "Snack2")
        item2 = Random.rand(find.length)
        self.set_meal_category_items(value, "item2", find, dinner_target, DINNER_ITEM2_ALLOCATION, item2)
        puts "dinner"
        # binding.pry
      when :snack3
        item1 = Random.rand(find.length)
        self.set_meal_category_items(value, "item1", find, snack3_target, SNACK3_ITEM1_ALLOCATION, item1)
        
        puts "snack3"
        # binding.pry
      end

    daily_meal[meal_category] = value
    end
    binding.pry
  end

  def self.set_meal_category_items(value, item_num, find, meal_target, item_allocation, db_id)
    value[item_num.to_sym][:name] = find[db_id].food
    value[item_num.to_sym][:grams] = ((find[db_id].per_grams / find[db_id].calories.to_f) * (meal_target * item_allocation)).round(-1)
    # binding.pry
  end
end
