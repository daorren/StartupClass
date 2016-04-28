class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :topics

  SETTINGS = ['account', 'password', 'profile', 'notifications']

  def password_confirmation options
    if options[:current_password].present? & options[:current_password] != self.password
      # flash[:error] = 'wrong current_password'
      return false
    end
    if options[:password_confirmation].present? & options[:password_confirmation] != options[:password]
      # flash[:error] = 'password confirmation failed'
      return false
    end
    return true
  end

  def update_user options
    if self.password_confirmation options
      self.update! options
    end
  end

end
