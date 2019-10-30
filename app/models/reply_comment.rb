class ReplyComment < ApplicationRecord
	belongs_to :video_rating
	belongs_to :end_user

	validates :comment, length: {in: 1..300}
end
