class Writer < ActiveRecord::Base

	include BCrypt

	has_many :posts
  has_many :responses
  has_many :post_responses, through: :posts, source: :responses
  has_many :responders, through: :post_responses, source: :writer

	validates :username, uniqueness: true
  validates :email, uniqueness: true
  validates :password, presence: true

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
