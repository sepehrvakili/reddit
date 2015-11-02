class VotesController < ApplicationController
  def upvote
    @post = Post.find(params[:id])
    @post.upvote.create_by current_user
    redirect_to links_path
  end
  
  def downvote
    @post = Post.find(params[:id])
    @post.downvote.create_by current_user
    redirect_to links_path
  end
end
