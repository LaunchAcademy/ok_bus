class Ride < ActiveRecord::Base
  belongs_to :bus

  validates :timeframe, presence: true
  validates :direction, presence: true
  validates :day,       presence: true
  validates :bus,       presence: true
end
