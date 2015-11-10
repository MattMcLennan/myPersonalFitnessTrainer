class RemoveBarbellShrugsFromExercises < ActiveRecord::Migration
  def change
    remove_column :exercises, :barbell_shrug, :string
  end
end
