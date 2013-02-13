require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should log in with valid credentials" do
    user = User.create! email: "x@x.com", password: "y"
    post :create, email: "x@x.com", password: "y"
    assert_redirected_to user

    # post to sessions/create with that info
    # assert redirected to where you expect
  end

  test "should not log in with invalid credentials" do
    user = User.create! email: "x@x.com", password: "y"
    post :create, email: "a@a.com", password: "b"
    assert_response :success
    assert_template "new"

    # post to sessions/create with bogus info
    # assert redirected to where you expect
  end
end

#how we use pull requests to build github