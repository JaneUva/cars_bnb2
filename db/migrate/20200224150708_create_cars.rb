class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.integer :capacity
      t.string :type
      t.string :brand
      t.integer :price
      t.boolean :online, default: true
      t.string :drive_train

      t.timestamps
    end
  end
end
