class AddPriceToAnimals < ActiveRecord::Migration[6.1]
  def change
    add_column :animals, :price, :integer, default: 0
  end
end
