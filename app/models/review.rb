class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :ride
  has_many :votes, dependent: :destroy

  validates :user, presence: true
  validates :ride, presence: true
  validates :rating, presence: true
end
