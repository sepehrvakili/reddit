class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:id])
    @post.comments.create!(content: params[:comment],
                           created_at: DateTime.now)
    redirect_to post_path(@post)
  end

  def destroy
    post = Post.find(params[:id])
    if current_user.id == post.user_id
      flash[:notice] = "comment successfully deleted"
      post.destroy
    else
      flash[:notice] = "That action can not be completed"
      redirect_to posts_path
    end
  end
