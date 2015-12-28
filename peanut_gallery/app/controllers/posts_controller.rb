class PostsController < ApplicationController

	def index
	end

	def active_posts
		@posts = Post.all
		render "posts/active_posts"
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.writer = current_user
		if @post.save
			redirect_to "/writers/#{current_user.id}"
		else 
			@errors = ["Something could not save properly. Please try again."]
			render "errors"
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def publish
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update_attributes(post_params)
		redirect_to "/posts/#{@post.id}"
	end

	def destroy
		@post = Post.find(params[:id])
		Post.delete(@post)
		redirect_to '/'
	end

	# types of posts controller

	def economics_posts
		@posts = Post.where(category: 1)
		render "posts/types/_posts_by_type"
	end

	def environment_posts
		@posts = Post.where(category: 2)
		render "posts/types/_posts_by_type"
	end

	def politics_posts
		@posts = Post.where(category: 3)
		render "posts/types/_posts_by_type"
	end

	def social_values_posts
		@posts = Post.where(category: 4)
		render "posts/types/_posts_by_type"
	end

	def education_posts
		@posts = Post.where(category: 5)
		render "posts/types/_posts_by_type"
	end

	def religion_posts
		@posts = Post.where(category: 6)
		render "posts/types/_posts_by_type"
	end

	def health_posts
		@posts = Post.where(category: 7)
		render "posts/types/_posts_by_type"
	end

	def foreign_policy_posts
		@posts = Post.where(category: 8)
		render "posts/types/_posts_by_type"
	end

	def military_posts
		@posts = Post.where(category: 9)
		render "posts/types/_posts_by_type"
	end

	def science_technology_posts
		@posts = Post.where(category: 10)
		render "posts/types/_posts_by_type"
	end

	private

	def post_params
	  params.require(:post).permit(:title, :content, :category, :requests_for_responses, :additional_resources, :writer)
	end
end
