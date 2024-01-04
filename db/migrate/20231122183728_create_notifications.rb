# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :visitor, foreign_key: { to_table: :users }
      t.references :visited, foreign_key: { to_table: :users }
      # t.integer :post_id
      # t.integer :comment_id
      t.references :post
      t.references :comment
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
