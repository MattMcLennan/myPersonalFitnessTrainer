class AddRoutineToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :routine, :string
  end
end
