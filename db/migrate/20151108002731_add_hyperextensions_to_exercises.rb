class AddHyperextensionsToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :hyperextensions, :integer
  end
end
