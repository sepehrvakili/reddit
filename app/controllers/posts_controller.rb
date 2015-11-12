class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @post = Post.new
    render :new
  end

  def index
    #@posts = Post.all.page(params[:page]).per(10)
   @posts = Post.page(params[:page]).per(10)
     render :index
  end

  def create
    @post = current_user.posts.create(
      title: params[:title],
      url: params[:url]
    )
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def update
    post = Post.find(params[:id])
    post.update(
      title: params[:title],
      url: params[:url],
      updated_at: DateTime.now
    )
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:id])
    if current_user.id == post.user_id
      flash[:notice] = "Destroyed the post: #{post.title}"
      post.destroy
    else
      flash[:notice] = "You don't have access to this post."
    end
    redirect_to posts_path
  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    redirect_to posts_path
  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_by current_user
    redirect_to posts_path
  end


end
