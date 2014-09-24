class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :timeframe
      t.string :direction
      t.string :day
      t.references :bus, index: true

      t.timestamps
    end
  end
end
