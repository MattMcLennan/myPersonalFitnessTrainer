class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :goal
      t.string :fitBit_ID
      t.string :fitBit_auth
      t.string :fatSecret_ID
      t.string :fatSecret_auth

      t.timestamps
    end
  end
end
