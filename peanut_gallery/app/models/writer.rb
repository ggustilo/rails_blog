class Writer < ActiveRecord::Base

	include BCrypt

	has_many :posts
  has_many :responses
  has_many :responders, through: :responses, source: :writer

	def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    self.password_hash = Password.create(new_password)
  end

  def authenticated?(password)
  	if self.password == password
  		return true
  	else
  		return false
  	end
  end
end
