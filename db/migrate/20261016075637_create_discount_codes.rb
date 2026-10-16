class CreateDiscountCodes < ActiveRecord::Migration[7.1]
  def change
    create_table :discount_codes do |t|
      t.string :code
      t.integer :discount_percentage
      t.datetime :expiry
      t.integer :max_uses
      t.boolean :is_active
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
