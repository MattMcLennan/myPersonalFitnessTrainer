class ExercisesController < ApplicationController

  def index
    @user_exercises = current_user.exercises
    render :json => @user_exercises
  end

  def show
    @exercise = Exercise.find_by(user_id: current_user)

    @squat = @exercise.squat_calc
    @squat_max = @exercise.squat_max

    @bench = @exercise.bench_calc
    @bench_max = @exercise.bench_max

    @deadlift = @exercise.deadlift_calc
    @deadlift_max = @exercise.deadlift_max

    @overhead_press = @exercise.overhead_press_calc
    @overhead_press_max = @exercise.overhead_press_max

    @barbell_row = @exercise.barbell_row_calc
    @barbell_row_max = @exercise.barbell_row_max
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
      create
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

      binding.pry

      redirect_to users_path
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
      :bench_reps,
      :deadlift_reps,
      :squat_reps,
      :overhead_press_reps,
      :barbell_row_reps
    )
  end

end
