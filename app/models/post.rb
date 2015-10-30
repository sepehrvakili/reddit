class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	belongs_to :user
	max_paginates_per 3
end
