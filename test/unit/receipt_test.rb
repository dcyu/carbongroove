require 'test_helper'

class ReceiptTest < ActiveSupport::TestCase
  test "emission for electricity" do
    receipt = Receipt.create! kind: 'elect', cost: '2'
    assert_equal '123', receipt.emission
  end
end
