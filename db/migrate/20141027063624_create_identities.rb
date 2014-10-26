class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.references :user, index: true
      t.string :provider, null: false
      t.string :uid, null: false

      t.timestamps
    end
  end
end
