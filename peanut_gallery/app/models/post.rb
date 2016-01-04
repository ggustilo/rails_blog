class Post < ActiveRecord::Base
	belongs_to :writer
	has_many :responses
	has_many :responders, through: :responses, source: :writer

	def approved_responses
		self.responses.where(approved: true).limit(3)
	end
end
