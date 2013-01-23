require 'test_helper'

class RootControllerTest < ActionController::TestCase
	test "root functional" do
		get :index
		assert_response :ok
	end

end