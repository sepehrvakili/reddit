class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :url, :title, :user_id, presence: true
  acts_as_votable
  belongs_to :user
  max_paginates_per 3
  votes=0
  def score
    votes= self.get_upvotes.size || self.get_downvotes.size
  end
end
