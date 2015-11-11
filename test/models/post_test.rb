require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def test_is_new_post_valid
  	post = user(first_name: "John", last_name: "Doe", email: "john@email.com", password_digest: "johndoeishere").posts.new(
  		url: "http://johndoeishere.com", title: "John Doe Is Here"
  		)
  	assert post.valid?
  end

end
