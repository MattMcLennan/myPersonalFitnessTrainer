class AddGoalWeightToUsers < ActiveRecord::Migration
  def change
    add_column :users, :goal_weight, :string
  end
end
