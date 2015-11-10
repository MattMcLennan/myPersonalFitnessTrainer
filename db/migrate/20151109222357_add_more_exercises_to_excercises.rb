class AddMoreExercisesToExcercises < ActiveRecord::Migration
  def change
    add_column :exercises, :calf_raise, :integer,  default: 0
    add_column :exercises, :pullups, :integer,  default: 0
  end
end
