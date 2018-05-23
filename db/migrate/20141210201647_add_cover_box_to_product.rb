class AddCoverBoxToProduct < ActiveRecord::Migration
  def change
    add_column :products, :coverbox, :string
  end
end
