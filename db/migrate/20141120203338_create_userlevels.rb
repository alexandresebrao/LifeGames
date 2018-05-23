class CreateUserlevels < ActiveRecord::Migration
  def change
    create_table :userlevels do |t|
      t.string :level

      t.timestamps
    end
  end
end
