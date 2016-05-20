class CommentsController < ApplicationController
	before_action :require_login, only: [:create]
	# before_action :require_correct_user, only: [:create]

  def index
  	@comments = Comment.all
  end

  def create
  	comment = Comment.new(content: comment_params['content'], user: current_user, event_id: params['comment'][:event_id])

  	if comment.save
  		redirect_to :back
  	else
  		flash[:errors] = comment.errors.full_messages
  		redirect_to :back
  	end
  end

  private
   def comment_params
   	params.require(:comment).permit(:content)
   end
end
