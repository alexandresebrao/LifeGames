class AddPublisherRefToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :publisher, index: true
  end
end
