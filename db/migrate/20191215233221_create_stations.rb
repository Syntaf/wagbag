class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.references :area, foreign_key: true
      t.string :name
      t.text :description
      t.integer :capacity
      t.boolean :active

      t.timestamps
    end
  end
end
