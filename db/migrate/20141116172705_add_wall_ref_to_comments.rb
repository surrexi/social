class AddWallRefToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :wall, index: true
  end
end
