class ChangeRideParametersToNullFalse < ActiveRecord::Migration
  def change
    change_column_null :rides, :timeframe, false
    change_column_null :rides, :direction, false
    change_column_null :rides, :day,       false
  end
end
