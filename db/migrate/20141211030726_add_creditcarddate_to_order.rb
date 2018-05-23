class AddCreditcarddateToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :creditcarddate, :string
  end
end
