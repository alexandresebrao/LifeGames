class AddTaxpriceToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :taxprice, :string
  end
end
