class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :type
      t.text :description
      t.timestamps
    end
  end
end
