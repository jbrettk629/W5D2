class CommentsController < ApplicationController
  
  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.post_id = params[:post_id]
    comment.save
    flash[:errors] = comment.errors.full_messages
    redirect_to post_url(comment.post)
    
  end
  
  
  
  
  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to post_url(comment.post)
    
  end
  
  
  def comment_params
    params.require(:comment).permit(:content)
  end
  
  
end