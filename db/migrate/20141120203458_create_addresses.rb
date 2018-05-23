class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :number
      t.string :street
      t.string :city
      t.string :postalcode

      t.timestamps
    end
  end
end
