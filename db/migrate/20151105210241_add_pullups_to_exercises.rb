class AddPullupsToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :pullups, :integer
  end
end
