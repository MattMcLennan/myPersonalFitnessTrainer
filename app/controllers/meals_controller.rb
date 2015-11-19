class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  def index
    @meals = JSON.parse(Meal.algo(current_user))
  end
end
