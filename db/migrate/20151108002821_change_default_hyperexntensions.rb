class ChangeDefaultHyperexntensions < ActiveRecord::Migration
  def change
    change_column_default(:exercises, :hyperextensions, 0)
  end
end
