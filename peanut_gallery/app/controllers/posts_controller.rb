class PostsController < ApplicationController

	def index
	end

	def active_posts
		if current_user
			@posts = Post.where(published: false)
			render "posts/active_posts"
		else
			redirect_to login_path
		end
	end

	def new
		if current_user
			@post = Post.new
		else
			redirect_to login_path
		end
	end

	def create
		if current_user
			@post = Post.new(post_params)
			@post.writer = current_user
		end
		if @post.save
			redirect_to "/writers/#{current_user.id}"
		else 
			@errors = ["Something could not save properly. Please try again."]
			render "errors"
		end
	end

	def show
		@post = Post.find_by(id: params[:id])
		if @post
			@responses = @post.responses
		else
			redirect_to login_path
		end
	end

	def publish
		@post = Post.find_by(id: params[:id])
		if @post && @post.published == false
			@post.update_attributes(published: true)
		elsif @post && @post.published == true
			@post.update_attributes(published: false)
		else
			@errors = ["Your post was already published."]
			render "errors"
		end
		if @post.save
			redirect_to '/'
		end
	end

	def upvote
		@post = Post.find_by(id: params[:id])
		@post.votes += 1
		if @post.save
			redirect_to posts_show_path(@post)
		else
			@errors = ["I'm sorry, but something went wrong and you cannot upvote at this time.  Please try again later."]
		end
	end

	def downvote
		@post = Post.find_by(id: params[:id])
		if @post.votes > 0
			@post.votes -= 1
		end
		if @post.save
			redirect_to posts_show_path(@post)
		else
			@errors = ["I'm sorry, but something went wrong and you cannot upvote at this time.  Please try again later."]
		end
	end

	def flag
		@post = Post.find_by(id: params[:id])
		if @post && @post.flagged == false
			@post.update_attributes(flagged: true)
		elsif @post && @post.flagged == true
			@post.update_attributes(flagged: false)
		else 
			@error = ["There was an error with your flag."]
		end
		if @post.save
			redirect_to posts_show_path(@post)
		end
	end

	def edit
		@post = Post.find_by(id: params[:id])
	end

	def update
		@post = Post.find_by(id: params[:id])
		@post.update_attributes(post_params)
		if @post.save
			redirect_to "/posts/#{@post.id}"
		end
	end

	def destroy
		@post = Post.find_by(id: params[:id])
		if Post.delete(@post)
			redirect_to '/'
		else
			@errors = ["You cannot delete this post at this time.  Please try again later."]
		end
	end

	# types of posts controller

	def economics_posts
		@posts = Post.where(category: 1, published: true)
		render "posts/types/_posts_by_type"
	end

	def environment_posts
		@posts = Post.where(category: 2, published: true)
		render "posts/types/_posts_by_type"
	end

	def politics_posts
		@posts = Post.where(category: 3, published: true)
		render "posts/types/_posts_by_type"
	end

	def social_values_posts
		@posts = Post.where(category: 4, published: true)
		render "posts/types/_posts_by_type"
	end

	def education_posts
		@posts = Post.where(category: 5, published: true)
		render "posts/types/_posts_by_type"
	end

	def religion_posts
		@posts = Post.where(category: 6, published: true)
		render "posts/types/_posts_by_type"
	end

	def health_posts
		@posts = Post.where(category: 7, published: true)
		render "posts/types/_posts_by_type"
	end

	def foreign_policy_posts
		@posts = Post.where(category: 8, published: true)
		render "posts/types/_posts_by_type"
	end

	def military_posts
		@posts = Post.where(category: 9, published: true)
		render "posts/types/_posts_by_type"
	end

	def science_technology_posts
		@posts = Post.where(category: 10, published: true)
		render "posts/types/_posts_by_type"
	end

	private

	def post_params
	  params.require(:post).permit(:title, :content, :category, :requests_for_responses, :additional_resources, :writer)
	end
end
