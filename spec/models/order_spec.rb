require 'spec_helper'

describe Order do
  describe "#discount_percentage" do
    let(:calculates_discount) { stub :discount_percentage => 10 }
    before { CalculatesDiscount.stub(:new).with(subject).and_return calculates_discount }

    it "delegates to CalculatesDiscount" do
      subject.discount_percentage.should == 10
    end
  end

  it "calculates discount (integration test)" do
    subject.stub :line_items => [stub(:total => 50), stub(:total => 50)]
    subject.discount_percentage.should == 5
  end
end
