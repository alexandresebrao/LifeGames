class AddTrackinfoToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :trackinfo, :string
  end
end
