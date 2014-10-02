class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :ride
  has_many :votes, dependent: :destroy
  accepts_nested_attributes_for :ride

  validates :user, presence: true
  validates :ride, presence: true
  validates :rating, presence: true

  def up_votes
    votes.where(direction: "up").count
  end

  def down_votes
    votes.where(direction: "down").count
  end

  def bus_destination
    if ride.direction = "inbound"
      ride.bus.inbound
    else
      ride.bus.outbound
    end
  end
end
