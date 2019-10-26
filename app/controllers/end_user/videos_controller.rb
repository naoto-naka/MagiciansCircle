class EndUser::VideosController < ApplicationController
  #before_action :authenticate_end_user!, only[:new,:create,:edit,:update,:destroy]
  def new
    @video = Video.new
  end

  def create
      video = Video.new(video_params)
      video.end_user_id = current_end_user.id
      if video.save
        redirect_to end_user_root_path
      else
      end
  end

  def index
    if params[:video]
      q = video_params[:q]
      @search_videos = Video.ransack(title_or_description_cont: q).result
      search_tags = Tag.ransack(name_cont: q).result
      search_tags.each do |search_tag|
        @search_videos = Video.tagged_with(search_tag.name)
      end
      search_category = Category.ransack(category_name_cont: q).result
      search_category.each do |search_category|
        @search_videos = search_category.videos
      end
      search_users = EndUser.ransack(user_name_cont: q).result
      search_users.each do |search_user|
        @search_videos = search_user.videos
      end
    else
      @search_videos = Video.page(params[:page]).per(10)
    end

    @video = Video.new
    if params[:video]
      if params[:video][:video] == "rate"
        @narrow_down_videos = @search_videos.sort_by{|video| video.video_ratings.sum(:rate)}.reverse
      elsif params[:video][:video] == "new"
        @narrow_down_videos = @search_videos.order(created_at: :desc)
      elsif params[:video][:video] == "play"
        @narrow_down_videos = @search_videos.order(views: :desc)
      end
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
      video.update(video_params)
      redirect_to end_user_videos_path
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
end
