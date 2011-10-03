require 'spec_helper'

describe Order do
  # if we want to just check the module's included
  it "includes the OrderExtensions::CalculatesDiscount module" do
    Order.included_modules.should include(OrderExtensions::CalculatesDiscount)
  end

  # or as an integration test
  it "integrates OrderExtensions::CalculatesDiscount" do
    subject.stub :line_items => [stub(:total => 50), stub(:total => 50)]
    subject.discount_percentage.should == 5
  end
end
