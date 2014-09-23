class ChangeRideParametersToNullFalse < ActiveRecord::Migration
  def up
    change_column :rides, :timeframe, :string, null: false
    change_column :rides, :direction, :string, null: false
    change_column :rides, :day,       :string, null: false
  end

  def down
    change_column :rides, :timeframe, :string
    change_column :rides, :direction, :string
    change_column :rides, :day,       :string
  end
end
