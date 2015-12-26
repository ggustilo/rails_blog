class Response < ActiveRecord::Base
	belongs_to :writer
	belongs_to :post
end
