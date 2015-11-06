class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :category, null: false
      t.integer :price, null: false
      t.string :color
      t.string :icon

      t.timestamps null: false
    end
  end
end
