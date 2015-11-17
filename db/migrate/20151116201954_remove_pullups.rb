class RemovePullups < ActiveRecord::Migration
  def change
    remove_column :exercises, :pullups, :string
  end
end
