class AddPlataformRefToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :platform, index: true
  end
end
