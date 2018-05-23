class AddUserlevelRefToUser < ActiveRecord::Migration
  def change
    add_reference :users, :userlevel, index: true
  end
end
