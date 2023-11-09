class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :username
      t.string :self_introduction
      t.string :location
      t.string :website
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
