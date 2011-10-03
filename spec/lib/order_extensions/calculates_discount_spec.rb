require "order_extensions/calculates_discount"

describe OrderExtensions::CalculatesDiscount do
  subject { stub(:line_items => []).extend OrderExtensions::CalculatesDiscount }

  context "for an empty order" do
    its(:discount_percentage) { should == 0 }
  end

  context "for an order under £100" do
    before { subject.stub :line_items => [stub(:total => 49.99), stub(:total => 50)] }
    its(:discount_percentage) { should == 0 }
  end

  context "for an order of £100" do
    before { subject.stub :line_items => [stub(:total => 50), stub(:total => 50)] }
    its(:discount_percentage) { should == 5 }
  end
end
