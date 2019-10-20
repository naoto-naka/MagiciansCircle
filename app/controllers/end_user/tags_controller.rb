class EndUser::TagsController < ApplicationController

  def create
    video = Video.find(params[:format])
    video.tag_list.add(tag_params[:tag_list])
    video.save
    redirect_to end_user_video_path(video)
  end

  def index
    @videos = Video.tagged_with(params[:name])
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
