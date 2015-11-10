class AddBarbellShrugsExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :barbell_shrug, :integer,  default: 0
    add_column :exercises, :close_grip_bench, :integer,  default: 0

  end
end
