class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :direction, presence: true
                        inclusion: { "up", "down" }
  validates :user, presence: true
  validates :review, presence: true
end
