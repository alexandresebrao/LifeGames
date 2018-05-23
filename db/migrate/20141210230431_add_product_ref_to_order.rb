class AddProductRefToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :product, :reference
  end
end
