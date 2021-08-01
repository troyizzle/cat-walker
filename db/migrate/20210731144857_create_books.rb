# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :icon, default: ""
      t.float :price, default: 0.0
      t.integer :time
      t.integer :appointment_type, default: 0

      t.timestamps
    end

    add_index :books, %i[time appointment_type], unique: true
  end
end
