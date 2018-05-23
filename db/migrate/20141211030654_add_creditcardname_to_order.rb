class AddCreditcardnameToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :creditcardname, :string
  end
end
