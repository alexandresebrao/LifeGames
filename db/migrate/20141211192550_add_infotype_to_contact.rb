class AddInfotypeToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :infotype, :string
  end
end
