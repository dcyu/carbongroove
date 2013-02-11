require 'test_helper'

class RootControllerTest < ActionController::TestCase
	test "root shows index if not logged in" do
		get :index
		assert_response :ok
    assert_template :index
	end

  test "root redirects to users/show if logged in" do
    user = create_user
    log_in(user)

    get :index
    assert_redirected_to user
  end

  def sdkjf
  end
end
