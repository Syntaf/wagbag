class CreateStationStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :station_statuses do |t|
      t.references :station, foreign_key: true
      t.references :user, foriegn_key: true
      t.integer :count
      t.string :notes

      t.timestamps
    end
  end
end
