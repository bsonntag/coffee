class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.integer :price
      t.string :category

      t.timestamps null: false
    end
  end
end
