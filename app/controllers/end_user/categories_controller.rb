class EndUser::CategoriesController < ApplicationController
  def index
  	@videos = Video.where(id: params[:format])
  end
end
