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
		print writer_params
		if @writer.save
			session[:id] = @writer.id if !current_user
			redirect_to "/writers/#{@writer.id}"
		else 
			@errors = ["Something could not save properly.  Please try again."]
			render "errors"
		end
	end

	def show
		@writer = current_user
		@posts = @writer.posts
		@responses = @writer.responses
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
