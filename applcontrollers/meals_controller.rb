class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  def index
    @meals = JSON.parse(Meal.algo(current_user))
  end

  # def new
  #   @meal = Meal.new
  # end

  # def destroy
  #   @meal.destroy
  # end

  # private
  #   def set_meal
  #     @meal = Meal.find(params[:id])
  #   end

  #   def meal_params
  #     params.require(:meal).permit(:food_name, :calories, :protien, :fat, :carbs)
  #   end
end
