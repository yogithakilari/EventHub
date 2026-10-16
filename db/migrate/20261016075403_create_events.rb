class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :venue_name
      t.string :city
      t.datetime :start_time
      t.datetime :end_time
      t.string :status
      t.integer :age_limit
      t.boolean :pet_friendly
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
