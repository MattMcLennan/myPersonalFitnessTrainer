class AddTemplateChosenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :template_chosen, :boolean, default: false
  end
end
