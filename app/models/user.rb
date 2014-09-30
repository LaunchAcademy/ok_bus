class User < ActiveRecord::Base
  has_many :reviews
  has_many :votes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username,
    presence: true,
    uniqueness: true
  mount_uploader :profile_photo, ProfilePhotoUploader
end
