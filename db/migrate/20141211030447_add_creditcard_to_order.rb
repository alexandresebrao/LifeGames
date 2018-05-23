class AddCreditcardToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :creditcard, :string
  end
end
