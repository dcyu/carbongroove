require 'test_helper'

class ReceiptTest < ActiveSupport::TestCase
  test "emission for purchase" do
    receipt = Receipt.create! kind: 'gasoline', cost: '4'
    assert_equal 12.6, receipt.emission
  end
end
