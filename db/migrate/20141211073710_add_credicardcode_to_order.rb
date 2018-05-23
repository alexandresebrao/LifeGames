class AddCredicardcodeToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :creditcardcode, :string
  end
end
