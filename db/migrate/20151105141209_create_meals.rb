class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :food
      t.integer :calories
      t.integer :protein
      t.integer :carbs
      t.integer :fat
      t.integer :per_grams
      t.string :diet_name
      t.string :category

      t.timestamps
    end
  end
end
