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
    # cals Defined by user
    user_cals_target = 2000
    nutrition_content = ["calories", "protein", "carbs", "fat"]

    breakfast_target = user_cals_target * BREAKFAST_TARGET_ALLOCATION
    snack1_target = user_cals_target * SNACK1_TARGET_ALLOCATION
    lunch_target = user_cals_target * LUNCH_TARGET_ALLOCATION
    snack2_target = user_cals_target * SNACK2_TARGET_ALLOCATION
    dinner_target = user_cals_target * DINNER_TARGET_ALLOCATION
    snack3_target = user_cals_target * SNACK3_TARGET_ALLOCATION
    weekly_meal = []

    7.times do 

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

          nutrition_content.each do |nutrition_category|
            self.generate_meal_category(value, "item1", find, nutrition_category, item1)
            self.generate_meal_category(value, "item2", find, nutrition_category, item2)
          end
        when :snack1
          item1 = Random.rand(find.length)
          item2 = Random.rand(find.length)
          
          # item2 cannot be the same as item1
          while item2 == item1 do 
            item2 = Random.rand(find.length)
          end

          self.set_meal_category_items(value, "item1", find, snack1_target, SNACK1_ITEM1_ALLOCATION, item1)
          self.set_meal_category_items(value, "item2", find, snack1_target, SNACK1_ITEM2_ALLOCATION, item2)

          nutrition_content.each do |nutrition_category|
            self.generate_meal_category(value, "item1", find, nutrition_category, item1)
            self.generate_meal_category(value, "item2", find, nutrition_category, item2)
          end
        when :lunch
          item1 = Random.rand(find.length)
          self.set_meal_category_items(value, "item1", find, lunch_target, LUNCH_ITEM1_ALLOCATION, item1)

          nutrition_content.each do |nutrition_category|
            self.generate_meal_category(value, "item1", find, nutrition_category, item1)
          end

          find = Meal.where("category LIKE ?", "Snack1")
          item2 = Random.rand(find.length)

          self.set_meal_category_items(value, "item2", find, lunch_target, LUNCH_ITEM2_ALLOCATION, item2)

          nutrition_content.each do |nutrition_category|
            self.generate_meal_category(value, "item2", find, nutrition_category, item2)
          end
        when :snack2
          item1 = Random.rand(find.length)
          item2 = Random.rand(find.length)

          # item2 cannot be the same as item1
          while item2 == item1 do 
            item2 = Random.rand(find.length)
          end

          self.set_meal_category_items(value, "item1", find, snack2_target, SNACK2_ITEM1_ALLOCATION, item1)
          self.set_meal_category_items(value, "item2", find, snack2_target, SNACK2_ITEM2_ALLOCATION, item2)

          nutrition_content.each do |nutrition_category|
            self.generate_meal_category(value, "item1", find, nutrition_category, item1)
            self.generate_meal_category(value, "item2", find, nutrition_category, item2)
          end
        when :dinner
          # Hard coded find to search for Lunch as that is the food category name in the DB
          # Foods meant for lunch or dinner can be interchanged
          find = Meal.where("category LIKE ?", "Lunch")
          item1 = Random.rand(find.length)
          self.set_meal_category_items(value, "item1", find, dinner_target, DINNER_ITEM1_ALLOCATION, item1)

          nutrition_content.each do |nutrition_category|
            self.generate_meal_category(value, "item1", find, nutrition_category, item1)
          end
          
          find = Meal.where("category LIKE ?", "Snack2")
          item2 = Random.rand(find.length)
          self.set_meal_category_items(value, "item2", find, dinner_target, DINNER_ITEM2_ALLOCATION, item2)

          nutrition_content.each do |nutrition_category|
            self.generate_meal_category(value, "item2", find, nutrition_category, item2)
          end
        when :snack3
          # Override value as only 1 item should be chosen for snack 3 --- Take it easy with night snacking!
          value = {
            item1: {
              name: "",
              grams: 0
            }
          }

          item1 = Random.rand(find.length)
          self.set_meal_category_items(value, "item1", find, snack3_target, SNACK3_ITEM1_ALLOCATION, item1)

          nutrition_content.each do |nutrition_category|
            self.generate_meal_category(value, "item1", find, nutrition_category, item1)
          end
        end
      daily_meal[meal_category] = value
      end
      weekly_meal.push(daily_meal)
    end
  end

  def self.set_meal_category_items(value, item_num, find, meal_target, item_allocation, db_id)
    value[item_num.to_sym][:name] = find[db_id].food
    value[item_num.to_sym][:grams] = ((find[db_id].per_grams / find[db_id].calories.to_f) * (meal_target * item_allocation)).round(-1)
  end

  def self.generate_meal_category(value, item_key, find, nutrition_category, db_id) 
    value[item_key.to_sym][nutrition_category.to_sym] = ((find[db_id][nutrition_category.to_sym] / find[db_id]["per_grams"].to_f) * value[item_key.to_sym][:grams]).round(-1)
  end

  def self.total_test(nutrition_content, weekly_meal)
    weekly_cals = 0

    weekly_meal.each do |daily_meal|
      daily_meal.each do |menu_category, value|
        value.each do |key, value|
          weekly_cals += value[:calories]
        end
      end
    end
    puts "total cals for the week: #{weekly_cals}"
  end 
end
