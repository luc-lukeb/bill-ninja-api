require 'test_helper'

class BillTest < ActiveSupport::TestCase

  def setup
    @bill = Bill.new
  end

  test "should not save Bill without title" do
    @bill.user = users(:one)
    @bill.items = [items(:one)]
    assert !@bill.save
  end

  test "should not save Bill without user" do
    @bill.title = "Fake Bill Title"
    @bill.items = [items(:one)]
    assert !@bill.save
  end

  test "should not save Bill without items" do
    @bill.title = "Fake Bill Title"
    @bill.user = users(:one)
    assert !@bill.save
  end

  test "should save Bill with required data" do
    @bill.title = "Fake Bill Title"
    @bill.user = users(:one)
    @bill.items = [items(:one)]
    assert @bill.save
  end

end
