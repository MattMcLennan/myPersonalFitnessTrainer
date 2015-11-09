class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all
  end

  def new
    if !current_user
      redirect_to users_path, alert: "Log in first!"
    else
      @exercise = Exercise.new
    end
  end

  def create
    if !current_user
      redirect_to users_path, alert: "Log in first!"
    else
      @exercise = Exercise.new(exercise_params)
      @exercise.user_id = current_user.id
      @exercise.save!

      current_user.update_attributes(template_chosen: true)
      current_user.save!
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(
      :bench,
      :deadlift,
      :squat,
      :overhead_press,
      :barbell_row,
      :barbell_shrug,
      :tricep_extension,
      :barbell_curl,
      :close_grip_bench,
      :cable_crunches
    )
  end

end
