class EndUser::ReplyCommentsController < ApplicationController
	def new
	   @reply_comment = ReplyComment.new
	   respond_to do |format|
	   	format.html
	   	format.js
	   end
	end

	def create
		@reply_comment = ReplyComment.new(reply_comment_params)
		@reply_comment.video_rating_id = params[:video_rating_id]
		respond_to do |format|
		  if @reply_comment.save
			  format.html
			  format.js
		  else
			  format.js{render :reply_comments_result}
		  end
	    end
	end

	def edit
		@reply_comment = ReplyComment.find(params[:id])
		respond_to do |format|
			format.html
			format.js
		end
	end

	def update
		@video_rating = VideoRating.find(params[:video_rating_id])
		@reply_comment = ReplyComment.find(params[:id])
		respond_to do |format|
		  if @reply_comment.update(reply_comment_params)
		  	format.html
		  	format.js
		  else
		  	format.js
		  end
	    end
	end

	def destroy
		reply_comment = ReplyComment.find(params[:id])
		reply_comment.destroy
		redirect_back(fallback_location: end_user_root_path)
	end

	private
	def reply_comment_params
		params.require(:reply_comment).permit(:comment)
	end
end
