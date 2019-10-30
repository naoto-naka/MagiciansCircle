class EndUser::TagsController < ApplicationController

  def create
    @video = Video.find(params[:format])
    @temp_video = Video.find(params[:format])
    if @video.tag_list.size < 10
      @video.tag_list.add(tag_params[:tag_list])
    else
      flash[:error] = "タグの上限は10個までです"
      @video_tags = @video.tag_list
      @video_rating = VideoRating.new
      @video_ratings = @video.video_ratings
      render "end_user/videos/show" and return
    end
    @video_tags = @video.tag_list
    @video_rating = VideoRating.new
    @video_ratings = @video.video_ratings
    if @video.save
      redirect_to end_user_video_path(@video)
    else
      flash[:error] = "タグ名は15文字以内で入力してください"
      @video_tags = @temp_video.tag_list
      render "end_user/videos/show"
    end
  end

  def index
    @videos = Video.tagged_with(params[:name]).page(params[:page])
  end

  def destroy
    video = Video.find(params[:id])
    video.tag_list.remove(params[:name])
    video.save
    redirect_to end_user_video_path(params[:id])
  end

  private

  def tag_params
    params.require(:video).permit(:tag_list)
  end
end
