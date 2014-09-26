class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :ride
  has_many :votes, dependent: :destroy

  validates :user, presence: true
  validates :ride, presence: true
  validates :rating, presence: true

  def up_votes
    votes.where(direction: "up").count
  end

  def down_votes
    votes.where(direction: "down").count
  end
end
