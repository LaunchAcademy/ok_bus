class Bus < ActiveRecord::Base
  has_many :rides

  validates :number,    presence: true
  validates :inbound,   presence: true
  validates :outbound,  presence: true
end
