class WritersController < ApplicationController

	def login_form
		if !current_user
		  render "writers/login_form"
		else
			 @errors = ["You are already logged in."]
			 render "errors"
		end
	end

	def login
		# authenticate, set session and redirect
		@user = Writer.find_by(username: params[:username])
		if @user && @user.authenticated?(params[:password]) && !current_user
			session[:id] = @user.id
			redirect_to '/'
		else
			@errors = ["Something went wrong with login.  Please try again."]
			render "writers/login_form"
		end
	end

	def logout
		if current_user
			session[:id] = nil
			redirect_to ''
		else
			@errors = ["Sorry, there was a problem."]
			render "errors"
		end
	end

	def new
		if !current_user
			@writer = Writer.new
		else
			@errors = ["You are already logged in."]
			render "errors"
		end
	end

	def create
		@writer = Writer.new(writer_params)
		if @writer.save
			session[:id] = @writer.id if !current_user
			redirect_to "/writers/#{@writer.id}"
		else 
			@errors = ["Something could not save properly.  The username or email you entered may already be taken. Please try again."]
			render "errors"
		end
	end

	def show
		if current_user
			@writer = current_user
			@posts = @writer.posts
			@responses = @writer.responses
			render @user
		else
			redirect_to login_path
		end
	end

	def public_show
		@writer = Writer.find(params[:id])
		@posts = @writer.posts.where(published: true)
		@responses = @writer.responses.where(approved: true)
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def writer_params
	  params.require(:writer).permit(:username, :email, :password, :self_description)
	end

end
