class User < ActiveRecord::Base
  include BCrypt

  has_many :albums
  has_many :photos, :through => :albums

  def password
    @password || Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(params)
    user = User.find_by_name(params[:name])
    return user if user && user.password == params[:password]
    return false if user == nil || user.password != params[:password]
  end

end
