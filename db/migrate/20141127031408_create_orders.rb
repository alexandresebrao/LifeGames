class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :totalprice
      t.float :price

      t.timestamps
    end
  end
end
