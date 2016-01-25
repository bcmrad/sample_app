require 'test_helper'



class UsersControllerTest < ActionController::TestCase
	def setup
		@user = users(:michael)
		@otheruser = users(:archer)
	end 

	test "should get new" do
		get :new
		assert_response :success
	end

	test "redirect edit when not logged in" do 
		get :edit, id: @user 
		assert_not flash.empty?
		assert_redirected_to login_url
	end

	test "redirect update when not logged in" do
		patch :update, id: @user, user: { name: @user.name, email: @user.email }
		assert_not flash.empty?
		assert_redirected_to login_url
	end
	test "redirect when logged in with wrong user" do
		log_in_as(@otheruser)
		get :edit, id: @user
		assert flash.empty?
		assert_redirected_to root_url
	end 
	test "should redirect update when logged in as wrong user" do
		log_in_as(@otheruser)
		patch :update, id: @user, user: { name: @user.name, email: @user.email }
		assert flash.empty?
		assert_redirected_to root_url
	end

	test "should redirect from users index when not logged in" do
		get :index
		assert_redirected_to login_url
	end 

	test "should redirect destroy when not logged in" do
		assert_no_difference 'User.count' do
			delete :destroy, id: @user
		end
		assert_redirected_to login_url
	end 

	test "should redirect destroy logged in as a a non-admin" do
		log_in_as(@otheruser)
		assert_no_difference 'User.count' do
			delete :destroy, id: @user
		end
		assert_redirected_to root_url
	end

	


	


end
