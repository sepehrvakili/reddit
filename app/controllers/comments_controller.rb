class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:id])
    @post.comments.create!(content: params[:comment])
    redirect_to post_path(@post)
  end

  def destroy
    post = Post.find(params[:id])
    if current_user.id == post.user_id
      flash[:notice] = "comment successfully deleted"
      post.comments.destroy
    else
      flash[:notice] = "That action can not be completed"
    end
    redirect_to posts_path
  end
end
