class AddChinupsToExericses < ActiveRecord::Migration
  def change
    add_column :exercises, :chinups, :integer,  default: 0
  end
end
