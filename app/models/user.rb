class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	#Remove has secure pass since we're now using devise:
  #has_secure_password
  has_many :posts
  acts_as_voter

end
