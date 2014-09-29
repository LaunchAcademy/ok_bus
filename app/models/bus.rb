class Bus < ActiveRecord::Base
  has_many :rides
  has_many :reviews, through: :rides, dependent: :destroy

  validates :number,    presence: true
  validates :inbound,   presence: true
  validates :outbound,  presence: true
end
