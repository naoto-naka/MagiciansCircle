class EndUser::VideoRatingsController < ApplicationController
  def new
    @video_rating = VideoRating.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    video_rating = VideoRating.new(video_rating_params)
    video_rating.end_user_id = current_end_user.id
    respond_to do |format|
      if video_rating.save
        @video_ratings = video_rating.video.video_ratings
        format.html
        format.js
      else
        format.js{render :new}
      end
    end
  end

  def index
  end

  def show
  end

  def edit
    @video_rating = VideoRating.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    video_rating = VideoRating.find(params[:id])
    respond_to do |format|
      if video_rating.update(video_rating_params)
        @video_ratings = video_rating.video.video_ratings
        format.html
        format.js
      else
        format.js{render :edit}
      end
    end
  end

  def destroy
    video_rating = VideoRating.find(params[:id])
    respond_to do |format|
      if video_rating.destroy
        @video_ratings = video_rating.video.video_ratings
        format.html
        format.js
      else
        format.js
      end
    end
  end

private
  def video_rating_params
    params.require(:video_rating).permit(:title,:rate,:video_id,:comment)
  end
end
