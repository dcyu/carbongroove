require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "receipts are blank to start" do
    assert_equal [], create_user.receipts
  end

  test "user email is present" do
    user = create_user
    assert :email, "User email must be present" 
  end

  test "user password is present" do
    user = create_user
    assert :password, "User email must be present" 
  end

  test "user requires unique email" do
    user = create_user
    assert user.valid?

    user2 = User.new email: user.email
    assert ! user2.valid?
  end


  test 'user email must include @ and . characters' do
    user = User.new email: "asfdkfhjg@asdf.com", password: "1q1q1q1q1q1q"
    assert user.valid?, "must include @ and ."
  end

  test "password length must be between 5 and 20 characters" do
  end

end
