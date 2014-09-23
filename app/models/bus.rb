class Bus < ActiveRecord::Base
  validates :number,    presence: true
  validates :inbound,   presence: true
  validates :outbound,  presence: true
end
