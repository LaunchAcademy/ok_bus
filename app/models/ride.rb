class Ride < ActiveRecord::Base
  belongs_to :bus

  validates :timeframe, presence: true,
                        uniqueness: { scope: :direction, :day, :bus}

  validates :direction, presence: true, uniqueness: true
                        uniqueness: { scope: :timeframe, :day, :bus}

  validates :day,       presence: true, uniqueness: true
                        uniqueness: { scope: timeframe:, :direction, :bus}

  validates :bus,       presence: true, uniqueness: true
                        uniqueness: { scope: timeframe:, :direction, :day}
end
