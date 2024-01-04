# frozen_string_literal: true

class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.references :follower, foreign_key: { to_table: :users }
      t.references :following, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
