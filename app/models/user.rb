class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_secure_password
  has_many :posts
  acts_as_voter
  validates_length_of :password, minimum: 10
  validates_uniqueness_of :email
  validates_presence_of :first_name, :last_name, :email, :password
end
