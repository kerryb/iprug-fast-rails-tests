require 'spec_helper'

describe LineItem do
  describe "#total" do
    it "is the product of quantity and price" do
      line_item = LineItem.new :quantity => 2, :price => 4.99
      line_item.total.should == 9.98
    end
  end
end
