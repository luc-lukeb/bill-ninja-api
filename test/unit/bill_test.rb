require 'test_helper'

class BillTest < ActiveSupport::TestCase

  test "should not save Bill without title or owner or items" do
    bill = Bill.new(:title => "Fake Bill Title")
    assert !bill.save
    bill = Bill.new(:owner => users(:one))
    assert !bill.save
    bill = Bill.new(:items => [items(:one)])
    assert !bill.save
  end

  test "should save Bill with title and owner and items" do
    bill = Bill.new(:title => "Fake Bill Title", :owner => users(:two), :items => [items(:two)])
    assert bill.save
  end

end
