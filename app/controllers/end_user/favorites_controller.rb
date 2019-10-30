class EndUser::FavoritesController < ApplicationController
  before_action :set_params,only: [:favorite]

  def index
    @favorite_videos = current_end_user.favorites_videos.page(params[:page])
  end

  def favorite
    if favorite = Favorite.find_by(end_user_id: @end_user.id,video_id: @video.id)
      favorite.destroy
      render json: @video.id
    else
      Favorite.create(end_user_id: @end_user.id,video_id: @video.id)
      render json: @video.id
    end
  end

  private

  def set_params
    @end_user = current_end_user
    @video = Video.find(params[:id])
  end
end
