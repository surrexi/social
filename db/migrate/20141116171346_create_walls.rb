class CreateWalls < ActiveRecord::Migration
  def change
    create_table :walls do |t|
      t.text :body
      t.integer :owner_id, index: true
      t.integer :sender_id, index: true

      t.timestamps
    end
  end
end
