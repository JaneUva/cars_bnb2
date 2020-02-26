class AddColumnToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :location, :string
    add_column :cars, :description, :string
    add_column :cars, :latitude, :float
    add_column :cars, :longitude, :float
  end
end
