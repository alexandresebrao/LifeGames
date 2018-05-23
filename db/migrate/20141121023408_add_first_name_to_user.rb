class AddFirstNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :fname, :string
  end
end
