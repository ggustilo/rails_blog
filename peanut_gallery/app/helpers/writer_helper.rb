module WriterHelper
	def current_user
		@current_user = Writer.find(session[:id]) if session[:id]
	end
end
