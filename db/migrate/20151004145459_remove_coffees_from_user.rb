class RemoveCoffeesFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :coffees, :integer
  end
end
