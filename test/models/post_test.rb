require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "post must have title and url" do
  	post = posts(:one)
  	post.title = nil
  	post.url = nil
  	refute post.save
  end

  test "post has many comments" do
  	post = posts(:one)
  	assert post.comments.count > 1
	end

end
