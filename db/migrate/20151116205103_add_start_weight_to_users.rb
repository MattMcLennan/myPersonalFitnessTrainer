class AddStartWeightToUsers < ActiveRecord::Migration
  def change
    add_column :users, :start_weight, :string
  end
end
