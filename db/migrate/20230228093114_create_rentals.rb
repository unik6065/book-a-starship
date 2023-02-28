class CreateRentals < ActiveRecord::Migration[7.0]
  def change
    create_table :rentals do |t|
      t.date :start_date
      t.date :end_date
      t.integer :price
      t.integer :renter_id
      t.references :starship, null: false, foreign_key: true

      t.timestamps
    end
    add_foreign_key :rentals, :users, column: :renter_id
  end
end
