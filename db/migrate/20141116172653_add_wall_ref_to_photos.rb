class AddWallRefToPhotos < ActiveRecord::Migration
  def change
    add_reference :photos, :wall, index: true
  end
end
