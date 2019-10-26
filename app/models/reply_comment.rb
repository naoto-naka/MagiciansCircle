class ReplyComment < ApplicationRecord
	belongs_to :video_rating
	validates :comment, length: {in: 1..300}
end
