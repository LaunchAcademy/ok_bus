# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "csv"


timeframes = ["6-9 AM",
              "9AM-12PM",
              "12-3PM",
              "3-6PM",
              "6-9PM",
              "9PM-12AM",
              "12-6AM"]
direction = ["inbound", "outbound"]
days = ["weekday", "weekend"]

CSV.foreach("db/data/buses.csv", headers: true) do |row|
  bus = Bus.find_or_create_by(row.to_hash)

  timeframes.each do |t|
    direction.each do |d|
      days.each do |day|
        ride_attr = {
          timeframe: t,
          direction: d,
          day: day,
          bus_id: bus.id
        }
        Ride.find_or_create_by(ride_attr)
      end
    end
  end
end
