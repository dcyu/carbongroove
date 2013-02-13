require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "receipts are blank to start" do
    assert_equal [], create_user.receipts
  end

  test "user requires unique email" do
    user = create_user
    assert user.valid?

    user2 = User.new email: user.email
    assert ! user2.valid?
  end

  test "user email must include @ character" do
    user = User.new email: "asfdkfhjg@asdf.com"
    assert user.valid?, "must include @"
  end

end
