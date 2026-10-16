class CreateTicketTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :ticket_types do |t|
      t.string :name
      t.decimal :price
      t.integer :seats
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
