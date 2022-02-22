class RemoveTypeFromAnimals < ActiveRecord::Migration[6.1]
  def change
    remove_column :animals, :type, :string
  end
end

