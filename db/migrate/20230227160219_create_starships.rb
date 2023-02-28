class CreateStarships < ActiveRecord::Migration[7.0]
  def change
    create_table :starships do |t|
      t.string :name
      t.string :description
      t.string :pickup_city
      t.integer :loaner_id
      t.float :price_per_day
      t.timestamps
    end
    add_foreign_key :starships, :users, column: :loaner_id
  end
end
