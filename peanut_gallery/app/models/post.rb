class Post < ActiveRecord::Base
	belongs_to :writer
	has_many :responses
	has_many :responders, through: :responses, source: :writer
end
