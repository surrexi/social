class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body
      t.integer :sender_id, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
