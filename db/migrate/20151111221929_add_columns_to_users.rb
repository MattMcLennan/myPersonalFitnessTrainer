class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avg_weekly_cals, :integer
    add_column :users, :weekly_meal, :text, array: true, default: []
    add_column :users, :gender, :string
    add_column :users, :weight, :integer
  end
end
