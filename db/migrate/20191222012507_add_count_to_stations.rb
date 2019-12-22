class AddCountToStations < ActiveRecord::Migration[5.1]
  def change
    add_column :stations, :count, :integer
  end
end
