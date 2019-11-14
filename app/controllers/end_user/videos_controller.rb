class EndUser::VideosController < ApplicationController
  before_action :authenticate_end_user!, only: [:new,:create,:edit,:update,:destroy]
  before_action :access_limit, only: [:edit,:update,:destroy]

  def new
    @video = Video.new
  end

  def create
    @video = current_end_user.videos.build(video_params)
    if @video.save
      redirect_to end_user_root_path
    else
      render :new
    end
  end

  def index

    @video = Video.new

    if params[:video]
      @search_videos = @video.search_videos(video_params[:q],params[:page])
    else
      @search_videos = Video.page(params[:page]).per(10)
    end

    if params[:video]
      @narrow_down_videos = @video.narrow_down_video(params[:video][:video],@search_videos)
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def show
    @video = Video.find(params[:id])
    @video_rating = VideoRating.new
    @video_ratings = @video.video_ratings
    @video_tags = @video.tag_list
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    video = Video.find(params[:id])
    respond_to do |format|
      if video.update(video_params) && video.video.recreate_versions!
        format.html { redirect_to end_user_videos_path}
      else
        format.html { render action: 'edit' }
        format.json { render json: video.errors}
      end
    end
  end

  def destroy
    video = Video.find(params[:id])
    video.destroy
    redirect_to  end_user_videos_path
  end

  def count
    @video = Video.find(params[:video_id])
    @video.views += 1
    @video.save
    render json: @video.views
  end

  private

  def video_params
    params.require(:video).permit(:title,:description,:video,:category_id,:q,:play,:new,:rate,:limit)
  end

  def access_limit
    @video = Video.find(params[:id])
    unless @video.end_user_id == current_end_user.id
      redirect_to end_user_root_path
    end
  end
end

