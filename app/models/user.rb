class User < ActiveRecord::Base
  has_many :posts


  validates_length_of :password, minimum: 10
  validates_uniqueness_of :email
  validates_presence_of :first_name, :last_name, :email, :password
end
