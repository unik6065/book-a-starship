class AddCoordinatesToStarships < ActiveRecord::Migration[7.0]
  def change
    add_column :starships, :latitude, :float
    add_column :starships, :longitude, :float
  end
end
