class ChangeRidesBusNullFalse < ActiveRecord::Migration
  def change
    change_column_null :rides, :bus_id, false
  end
end
