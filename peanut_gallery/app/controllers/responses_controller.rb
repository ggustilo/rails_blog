class ResponsesController < ApplicationController

	def new
		@response = Response.new
	end

	def create
		@response = Response.new(response_params)
		@response.writer = current_user
		@response.post = Post.find(params[:post_id])
		if @response.save
			redirect_to "/writers/#{current_user.id}"
		else 
			@errors = ["Something could not save properly. Please try again."]
			render "errors"
		end
	end

	def index
		render "_index"
	end

	def approve
		@response = Response.find(params[:id])
		if @response.approved == false
			@response.update_attributes(approved: true)
		elsif @response.approved == true
			@response.update_attributes(approved: false)
		else
			@errors = ["Your response was already approved."]
			render "errors"
		end
		redirect_to '/'
	end

	def upvote
		@response = Response.find(params[:id])
		@response.votes += 1
		if @response.save
			redirect_to responses_show_path(@response.post, @response)
		else
			@error = ["There was an error with your vote."]
		end
	end

	def downvote
		@response = Response.find(params[:id])
		if @response.votes > 0
			@response.votes -= 1
		end
		if @response.save
			redirect_to responses_show_path(@response.post, @response)
		else 
			@error = ["There was an error with your vote."]
		end
	end

	def show
		@response = Response.find(params[:id])
	end

	def edit
		@response = Response.find(params[:id])
	end

	def update
		@response = Response.find(params[:id])
		@response.update_attributes(response_params)
		redirect_to "/posts/#{@response.post.id}"
	end

	def destroy
		@response = Response.find(params[:id])
		Response.delete(@response)
		redirect_to '/'
	end

	private

	def response_params
	  params.require(:response).permit(:title, :content, :writer, :post)
	end
end
