class VideoRating < ApplicationRecord
  belongs_to :end_user
  belongs_to :video
  has_many :reply_comments
end
