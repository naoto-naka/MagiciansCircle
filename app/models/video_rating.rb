class VideoRating < ApplicationRecord
  belongs_to :end_user
  belongs_to :video
  has_many :reply_comments
  validates :comment, length: {in: 0..300}
end
