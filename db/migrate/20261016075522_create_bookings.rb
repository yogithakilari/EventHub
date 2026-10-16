class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.integer :ticket_quantity
      t.decimal :amount_paid
      t.decimal :discount
      t.string :booking_status
      t.string :booking_reference
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
