class AddDefaultPullupToExercises < ActiveRecord::Migration
  def change
    change_column_default(:exercises, :pullups, 0)
  end
end
