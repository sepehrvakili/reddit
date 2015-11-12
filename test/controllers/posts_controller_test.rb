require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  def login_user
  	session[:user_id] = users(:steve).id
  end

  test "logged in user can create a post" do
  	login_user

  	assert_difference('Post.count') do
  		post :create, { title: "Title", url: "http://www.com" }
  	end

  	assert_not_nil assigns(:post)
  	assert_redirected_to post_path(assigns(:post))

  end

  test "non-logged-in user cannot create a post" do
		get :new
		assert_redirected_to login_path
	end

	test "logged-in user can edit a post with id given" do
		login_user

		get :edit, { id: posts(:one).id }

		assert_response :success
		assert_not_nil assigns(:post)
	end

end
