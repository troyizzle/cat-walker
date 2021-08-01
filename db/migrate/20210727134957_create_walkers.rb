# frozen_string_literal: true

class CreateWalkers < ActiveRecord::Migration[6.1]
  def change
    create_table :walkers do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :terms
      t.integer :zip
      t.integer :range

      t.timestamps
    end
  end
end
