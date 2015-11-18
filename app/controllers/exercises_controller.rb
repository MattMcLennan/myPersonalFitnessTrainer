class ExercisesController < ApplicationController

  def index
    @user_exercise = Exercise.find_by(user_id: current_user)
    render :json => @user_exercise
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
      date = DateTime.now.in_time_zone('Eastern Time (US & Canada)')
      year = date.year
      month = date.month
      day = date.day
      get_weight = params["exercise"]

      current_user.squat.push([year, month, day, get_weight["squat"].to_i])
      current_user.deadlift.push([year, month, day, get_weight["deadlift"].to_i])
      current_user.bench.push([year, month, day, get_weight["bench"].to_i])
      current_user.overhead_press.push([year, month, day, get_weight["overhead_press"].to_i])
      current_user.barbell_row.push([year, month, day, get_weight["barbell_row"].to_i])

      current_user.save!

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
