class Ride < ActiveRecord::Base
  belongs_to :bus

  validates :timeframe,
            presence: true,
            uniqueness: { scope: [ :direction, :bus, :day ] }
  validates :direction,
            presence: true,
            uniqueness: { scope: [ :timeframe, :bus, :day ] }
  validates :day,
            presence: true,
            uniqueness: { scope: [ :timeframe, :bus, :direction ] }
  validates :bus,
            presence: true,
            uniqueness: { scope: [ :timeframe, :day, :direction ] }
end
