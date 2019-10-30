class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :image, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :video_ratings
  has_many :favorites,dependent: :destroy
  has_many :favorites_videos, through: :favorites,source: :video
  has_many :videos
  has_many :reply_comments,dependent: :destroy

  def username
    self.user_name
  end

end
