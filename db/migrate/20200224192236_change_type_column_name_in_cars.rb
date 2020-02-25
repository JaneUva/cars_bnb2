class ChangeTypeColumnNameInCars < ActiveRecord::Migration[5.2]
  def change
    rename_column :cars, :type, :kind
  end
end
