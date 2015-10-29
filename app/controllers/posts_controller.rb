class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params.require(:post).permit(:title,:content))
		if @post.save
			redirect_to posts_path, :notcie =>"Successfully created!"
		else
			render "new"
		end

	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
	end	if @post.save
			redirect_to posts_path, :notcie =>"Successfully edited!"
		else
			render "edit"

	def destroy
	end

end
