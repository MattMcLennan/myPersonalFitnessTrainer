class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  def index
    @meals = Meal.algo
  end

  def new
    @meal = Meal.new
  end

  def create
    # @meal = Meal.new(meal_params)

    # # render :json @meal

    # # respond_to do |format|
    # #   if @meal.save
    # #     format.html { redirect_to @meal, notice: 'Meal was successfully created.' }
    # #     format.json { render :show, status: :created, location: @meal }
    # #   else
    # #     format.html { render :new }
    # #     format.json { render json: @meal.errors, status: :unprocessable_entity }
    # #   end
    # # end
    # render :json @meal
  end

  def destroy
    @meal.destroy
  end

  private
    def set_meal
      @meal = Meal.find(params[:id])
    end

    def meal_params
      params.require(:meal).permit(:food_name, :calories, :protien, :fat, :carbs)
    end
end
