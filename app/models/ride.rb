class Ride < ActiveRecord::Base
  DIRECTIONS = ["inbound", "outbound"]
  DAYS = ["weekday", "weekend"]
  TIMEFRAMES = [
    "6-9 AM",
    "9AM-12PM",
    "12-3PM",
    "3-6PM",
    "6-9PM",
    "9PM-12AM",
    "12-6AM"
  ]

  belongs_to :bus
  has_many :reviews

  validates :timeframe,
    presence: true,
    inclusion: { in: TIMEFRAMES }

  validates :direction,
    presence: true,
    inclusion: { in: DIRECTIONS }
  validates :day,
    presence: true,
    inclusion: { in: DAYS }
  validates :bus,
    presence: true,
    uniqueness: { scope: [:timeframe, :day, :direction] }

  def description
    "#{timeframe} - #{direction} - #{day}"
  end
end
