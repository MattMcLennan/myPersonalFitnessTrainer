class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all
  end

  def edit
    if !current_user
      redirect_to users_path, alert: "Log in first!"
    else
      @exercise = Exercise.find_by(user_id: current_user)
    end
  end

  def update
    @exercise = Exercise.find_by(user_id: current_user.id)

    if @exercise.update(exercise_params)
      redirect_to users_path
    else
      render :edit
    end
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
      :tricep_extension,
      :barbell_curl,
      :cable_crunches,
      :calf_raise,
      :pullups,
      :bench_reps,
      :deadlift_reps,
      :squat_reps,
      :overhead_press_reps,
      :barbell_row_reps,
      :tricep_extension_reps,
      :barbell_curl_reps,
      :cable_crunches_reps,
      :calf_raise_reps,
      :pullup_reps
    )
  end

end
