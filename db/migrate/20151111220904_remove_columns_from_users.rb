class RemoveColumnsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :password_digest
    remove_column :users, :fitBit_ID
    remove_column :users, :fitBit_auth
    remove_column :users, :fatSecret_ID
    remove_column :users, :fatSecret_auth
  end
end

# add average_cals and weekly_meal