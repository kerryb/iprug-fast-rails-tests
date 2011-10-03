class Order
  def initialize order_record
    @order_record = order_record
  end

  def self.create line_items
    new(OrderRecord.create! :line_items => line_items)
  end

  def discount_percentage
    @order_record.line_items.inject(0) {|a, l| a + l.total } >= 100 ? 5 : 0
  end
end
