require 'test_helper'

class BillTest < ActiveSupport::TestCase

  test "should not save Bill without title or user or items" do
    bill = Bill.new(:title => "Fake Bill Title")
    assert !bill.save
    bill = Bill.new(:user => users(:one))
    assert !bill.save
    bill = Bill.new(:items => [items(:one)])
    assert !bill.save
  end

  test "should save Bill with title and user and items" do
    bill = Bill.new(:title => "Fake Bill Title", :user => users(:two), :items => [items(:two)])
    assert bill.save
  end

end
