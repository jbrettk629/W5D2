class PostsController < ApplicationController
    before_action :require_login
  
  def new
    @post = Post.new
    @sub = Sub.find(params[:sub_id])
  end 
  
  def create 
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    #@post.sub_id = params[:sub_id] 
    
    if @post.save
      redirect_to post_url(@post)
    else 
      flash[:errors] = @post.errors.full_messages 
      render :new 
    end 
  end 
  
  def show
    @post = Post.find(params[:id])
    # @sub = @post.subs.find(params[:id])
  end 
  
  def edit
    @post = current_user.posts.find(params[:id])
  end 
  
  def update 
    @post = current_user.posts.find(params[:id])
    
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit 
    end 
  end 
  
  def post_params
    params.require(:post).permit(:title, :content, sub_ids: [])
  end 
  
end 