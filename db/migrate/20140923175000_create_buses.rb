class CreateBuses < ActiveRecord::Migration
  def change
    create_table :buses do |t|
      t.string :number, null: false
      t.string :inbound, null: false
      t.string :outbound, null: false

      t.timestamps
    end
  end
end
