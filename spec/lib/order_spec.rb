require "order"

# Dummy persistence class because we aren't loading Rails classes
class OrderRecord; end

describe Order do
  let(:line_items) { stub }
  before { OrderRecord.stub :create! }

  describe "#create" do
    it "Creates a user record" do
      OrderRecord.should_receive(:create!).with :line_items => line_items
      Order.create line_items
    end

    it "returns a new Order" do
      Order.create(line_items).should be_an(Order)
    end
  end

  describe "calculating discounts" do
    let(:order_record) { stub }
    subject { Order.new order_record }

    context "for an empty order" do
      before { order_record.stub :line_items => [] }
      its(:discount_percentage) { should == 0 }
    end

    context "for an order under £100" do
      before { order_record.stub :line_items => [stub(:total => 49.99), stub(:total => 50)] }
      its(:discount_percentage) { should == 0 }
    end

    context "for an order of £100" do
      before { order_record.stub :line_items => [stub(:total => 50), stub(:total => 50)] }
      its(:discount_percentage) { should == 5 }
    end
  end
end
