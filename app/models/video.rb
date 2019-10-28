 class Video < ApplicationRecord
  belongs_to :category
  belongs_to :tag, optional: true
  belongs_to :end_user
  has_many :video_ratings, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :end_users, through: :favorites
  #accepts_nested_attributes_for :category
  mount_uploader :video, VideoUploader
  acts_as_taggable_on :labels
  acts_as_taggable

  enum limit:{公開:0, プライベート:1}

  validates :title, length: {in: 1..30}
  validates :description, length: {in:0..800}
  validates :video, presence: true

 end
