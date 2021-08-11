class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :walker, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.references :cat, null: false, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
