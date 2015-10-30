class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def new
		@post = Post.new
		render :new
	end

	def index
		@posts = Post.page(params[:page]).per(10)
		render :index
	end

	def create
    post = current_user.posts.create(
    	title: params[:title],
			url: params[:url],
      created_at: DateTime.now
      )
    redirect_to post_path(post)
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


end
