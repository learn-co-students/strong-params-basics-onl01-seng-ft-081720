class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		#allows all parameters to be created
	  @post = Post.new(post_params(:title, :description))
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
		@post = Post.find(params[:id])
		#allows only the title in the update method to be changed.
	  @post.update(post_params(:title))
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end

	private 
	# add a splat args parameter to method
		def post_params(*args)
			# allows all parameter to be passed
			# params.require(:post).permit(:title, :description)
			# Allows only the parameters that you want to be passed in
			params.require(:post).permit(*args)
		end
end
