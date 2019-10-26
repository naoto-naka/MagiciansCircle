class EndUser::PostsController < ApplicationController
  def top
  	@new_videos = Video.order(created_at: :desc).limit(10)
  	@update_videos = Video.order(updated_at: :desc).limit(10)

    @new_events = Video.order(created_at: :desc).limit(10)
  	@update_events = Video.order(updated_at: :desc).limit(10)

    @videos_rating_ranking = Video.find(VideoRating.group(:video_id).order('sum(rate) desc').limit(3).pluck(:video_id))
    @videos_views_ranking = Video.all.order(views: :desc).limit(3)

    @new_videos = Video.all.order(created_at: :desc).limit(10)
  end

  def about
  end
end
