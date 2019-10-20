class EndUser::ReplyCommentsController < ApplicationController
	def new
	   @reply_comment = ReplyComment.new
	   respond_to do |format|
	   	format.html
	   	format.js
	   end
	end

	def create
		replay_comment = ReplyComment.new(replay_comment_params)
		replay_comment.video_rating_id = params[:video_rating_id]
		respond_to do |format|
		  if replay_comment.save
			  format.html
			  format.js
		  else
			  format.js{render :new}
		  end
	    end
	end

	def destroy
		reply_comment = ReplyComment.find(params[:id])
		reply_comment.destroy
		redirect_back(fallback_location: end_user_root_path)
	end

	private
	def replay_comment_params
		params.require(:reply_comment).permit(:comment)
	end
end
