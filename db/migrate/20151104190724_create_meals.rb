class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :food_name
      t.integer :calories
      t.integer :protien
      t.integer :fat
      t.integer :carbs
      t.references :user, index: true

      t.timestamps
    end
  end
end
