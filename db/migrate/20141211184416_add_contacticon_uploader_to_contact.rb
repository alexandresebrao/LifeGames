class AddContacticonUploaderToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :icon, :string
  end
end
