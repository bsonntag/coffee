class RemoveDrinks < ActiveRecord::Migration
  def change
    drop_table :drinks
  end
end
