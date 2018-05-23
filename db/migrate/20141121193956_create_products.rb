class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.integer :stock_quantity
      t.integer :discount_percentage

      t.timestamps
    end
  end
end
