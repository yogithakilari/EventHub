class CreateBookingItems < ActiveRecord::Migration[7.1]
  def change
    create_table :booking_items do |t|
      t.integer :seats_booked
      t.decimal :price
      t.references :booking, null: false, foreign_key: true
      t.references :ticket_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
