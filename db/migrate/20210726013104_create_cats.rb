# frozen_string_literal: true

class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :breed
      t.integer :weight
      t.datetime :birthday

      t.timestamps
    end
  end
end
